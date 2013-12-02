matlab-roll
===========

The SDSC matlab roll is under development.

## Requirements

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
this patch file will need to be updated for versions of MATLAB other than the one
currently supported by this Rocks roll source (MATLAB R2013a).
