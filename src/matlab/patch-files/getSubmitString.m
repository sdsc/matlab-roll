function submitString = getSubmitString(jobName, quotedLogFile, quotedCommand, ...
    varsToForward, additionalSubmitArgs)
%GETSUBMITSTRING Gets the correct qsub command for a PBS scheduler

% Copyright 2010 The MathWorks, Inc.
% $Revision$  $Date$

envString = sprintf('%s,', varsToForward{:});
% Remove the final ','
envString = envString(1:end-1);

% Submit to PBS using qsub. Note the following:
% "-N Job#" - specifies the job name
% "-j oe" joins together output and error streams
% "-o ..." specifies where standard output goes to
% "-v ..." specifies which environment variables to forward
submitString = sprintf( 'qsub -N %s -j oe -o %s -v %s %s %s', ...
    jobName, quotedLogFile, envString, additionalSubmitArgs, quotedCommand);


