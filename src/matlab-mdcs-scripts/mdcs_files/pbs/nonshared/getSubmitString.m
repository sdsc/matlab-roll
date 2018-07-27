function submitString = getSubmitString(jobName, quotedLogFile, quotedCommand, ...
    varsToForward, additionalSubmitArgs)
%GETSUBMITSTRING Gets the correct qsub command for a PBS cluster

% Copyright 2010-2017 The MathWorks, Inc.

envString = strjoin(varsToForward', ',');

% Submit to PBS using qsub. Note the following:
% "-N Job#" - specifies the job name
% "-j oe" joins together output and error streams
% "-o ..." specifies where standard output goes to
% envString has the "-v 'NAME,NAME2'" piece.
submitString = sprintf('qsub -N %s -j oe -o %s -v %s %s %s', ...
    jobName, quotedLogFile, envString, additionalSubmitArgs, quotedCommand);
