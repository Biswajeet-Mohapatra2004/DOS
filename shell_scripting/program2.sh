#!/bin/bash
echo "Login Name of the user: $LOGNAME"
echo "Name of the unix syster: $(uname -s)"
echo "type of shell: $SHELL"
echo "current working directory: $(pwd)"
echo "file in directory $(pwd) are:"
ls -l
