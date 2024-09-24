#!/bin/bash

# export variables
export BOX64_PATH=~/wine/bin/;
export BOX64_LD_LIBRARY_PATH=~/wine/lib64/wine/x86_64-unix/:/lib/x86_64-linux-gnu:/lib/aarch64-linux-gnu;

# launch steamcmd
box64 wine/bin/wine64 steamcmd/steamcmd.exe;
