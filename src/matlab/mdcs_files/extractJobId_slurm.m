function jobID = extractJobId_slurm(cmdOut)
% Extracts the job ID from the qsub command output for SLURM

% Copyright 2010-2011 The MathWorks, Inc.

% jobId should be in the following format:
% 123.server-name

% The second piece of the regexp must pick out valid (fully-qualified) server names
jobID = regexp(cmdOut, '\d+', 'match', 'once');
dctSchedulerMessage(0, '%s: Job ID %s was extracted from qstat output %s.', mfilename, jobID, cmdOut);

