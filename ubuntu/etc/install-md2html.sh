#!/usr/bin/env bash

# Create a symbolic link on md2html.sh
# git-github [folder containing]
# - git clone https://github.com/doali/linux.git
# - and certainly more repositories

readonly SCRIPT=md2html
readonly TARGET=${HOME}/.local/bin

ln -snf ${HOME}/git-github/linux/ubuntu/bin/${SCRIPT}/${SCRIPT}.sh ${TARGET}/${SCRIPT}
