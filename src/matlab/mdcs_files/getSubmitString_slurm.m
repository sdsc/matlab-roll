function submitString_slurm = getSubmitString_slurm(jobName, quotedLogFile, quotedCommand, ...
    varsToForward, additionalSubmitArgs)
%GETSUBMITSTRING Gets the correct qsub command for a PBS cluster

% Copyright 2010-2013 The MathWorks, Inc.

envString = '';

% Submit to SLURM  using qsub. Note the following:
% "-N Job#" - specifies the job name
% "-j oe" joins together output and error streams
% "-o ..." specifies where standard output goes to
% envString has the "-v 'NAME,NAME2'" piece.
submitString_slurm = sprintf('/usr/bin/sbatch -J %s -o %s -e %s %s %s %s', ...
    jobName, quotedLogFile, quotedLogFile,envString, additionalSubmitArgs, quotedCommand);
