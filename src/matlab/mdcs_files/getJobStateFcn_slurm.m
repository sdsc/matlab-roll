function state = getJobStateFcn_slurm(cluster, job, state)
%GETJOBSTATEFCN Gets the state of a job from SLURM
%
% Set your cluster's GetJobStateFcn to this function using the following
% command:
%     set(cluster, 'GetJobStateFcn', @getJobStateFcn);

% Copyright 2010-2015 The MathWorks, Inc.

% Store the current filename for the errors, warnings and dctSchedulerMessages
currFilename = mfilename;
if ~isa(cluster, 'parallel.Cluster')
    error('parallelexamples:GenericSLURM:SubmitFcnError', ...
        'The function %s is for use with clusters created using the parcluster command.', currFilename)
end
if ~cluster.HasSharedFilesystem
    error('parallelexamples:GenericSLURM:SubmitFcnError', ...
        'The submit function %s is for use with shared filesystems.', currFilename)
end

% Shortcut if the job state is already finished or failed
jobInTerminalState = strcmp(state, 'finished') || strcmp(state, 'failed');
if jobInTerminalState
    return;
end
 % Get the information about the actual cluster used
data = cluster.getJobClusterData(job);
if isempty(data)
    % This indicates that the job has not been submitted, so just return
    dctSchedulerMessage(1, '%s: Job cluster data was empty for job with ID %d.', currFilename, job.ID);
    return
end
try
    jobIDs = data.ClusterJobIDs;
catch err
    ex = MException('parallelexamples:GenericSLURM:FailedToRetrieveJobID', ...
        'Failed to retrieve clusters''s job IDs from the job cluster data.');
    ex = ex.addCause(err);
    throw(ex);
end

% Get the full display from qstat so that we can look for "job_state = "
commandToRun = sprintf('squeue -j %s -o %t', sprintf('"%s" ', jobIDs{:}));
dctSchedulerMessage(4, '%s: Querying cluster for job state using command:\n\t%s', currFilename, commandToRun);

try
    % We will ignore the status returned from the state command because
    % a non-zero status is returned if the job no longer exists
    % Make the shelled out call to run the command.
    [~, cmdOut] = system(commandToRun);
catch err
    ex = MException('parallelexamples:GenericSLURM:FailedToGetJobState', ...
        'Failed to get job state from cluster.');
    ex = ex.addCause(err);
    throw(ex);
end

clusterState = iExtractJobState(cmdOut, numel(jobIDs));
dctSchedulerMessage(6, '%s: State %s was extracted from cluster output.', currFilename, clusterState);


% If we could determine the cluster's state, we'll use that, otherwise
% stick with MATLAB's job state.
if ~strcmp(clusterState, 'unknown')
    state = clusterState;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function state = iExtractJobState(qstatOut, numJobs)
% Function to extract the job state from the output of qstat -f

% For SLURM, the pending states are HQSTUW, the running states are BRE
% For Torque, the pending states are HQW, the running states are RE
 numPending = numel(regexp(qstatOut, '^PD'));
 numRunning = numel(regexp(qstatOut, '^R|^CG'));
 numFinished = numel(regexp(qstatOut, 'Invalid job id specified|^CD|^TO|NF'));
% If all of the jobs that we asked about have finished, then we know the job has finished.  
if numFinished == numJobs
    state = 'finished';
    return;
end

% Any running indicates that the job is running
if numRunning > 0
    state = 'running';
    return;
end

% We know numRunning == 0 so if there are some still pending then the
% job must be queued again, even if there are some finished
if numPending > 0
    state = 'queued';
    return
end

state = 'unknown';
