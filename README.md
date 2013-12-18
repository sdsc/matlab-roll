# SDSC "matlab" roll

## Overview

This roll bundles the installation of MATLAB.

**NOTE: The actual MATLAB installer and licenses must be obtained from The
Mathworks(r) directly as this roll only wraps the software into a Rocks roll for
installation into a Rocks cluster.**

For more information about the MATLAB please visit their official web page:

- <a href="https://www.mathworks.com/products/matlab/"
target="_blank">MATLAB</a> is a high-level language and interactive environment
for numerical computation, visualization, and programming.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

You *must* place two files in `src/matlab/` in order to build this roll...

```
    fik.txt     - contains your MATLAB 'File Installation Key'
    license.dat - contains your MATLAB client license file
```

Both should be obtained from The Mathworks or your MATLAB License administrator.

In addition, non-SDSC users *must* also place a `tar.gz` bundle of the MATLAB
installation source created from the ISO downloaded from The Mathworks in the
`src/matlab` directory. That file should be named to match the pattern listed
in `src/matlab/version.mk` and the `version.mk` file should be edited appropriately.

Finally, a conflict between the MATLAB `install` script, located INSIDE the
MATLAB source, and the Rocks roll development files exists that is patched with
a patch contained in `src/matlab/patch-files/install.patch`. It is likely that
this patch file will need to be updated for versions of MATLAB other than the
one currently supported by this Rocks roll source (MATLAB R2013a).


## Dependencies

Unknown at this time.


## Building

To build the matlab-roll, execute these instructions on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `matlab-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll matlab
% cd /export/rocks/install
% rocks create distro
% rocks run roll matlab | bash
```

In addition to the software itself, the roll installs matlab environment
module files in:

```shell
/opt/modulefiles/applications/matlab
```


## Testing

The matlab-roll includes a test script which can be run to verify proper
installation of the matlab-roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/matlab.t 
ok 1 - matlab is installed
ok 2 - matlab test run
ok 3 - matlab module installed
ok 4 - matlab version module installed
ok 5 - matlab version module link created
1..5
```
