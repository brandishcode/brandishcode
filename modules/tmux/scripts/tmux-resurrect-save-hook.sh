#!/bin/bash

RESURRECT_FILE=~/.tmux/resurrect/last
sed -i 's/\(--cmd\s\)\(\S*\s\S*\)//g' $RESURRECT_FILE
