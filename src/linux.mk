SRCDIRS = `find . -maxdepth 1 -type d \
        -not -name CVS \
        -not -name matlab-rpms \
        -not -name build-\* \
        -not -name .` matlab-rpms
