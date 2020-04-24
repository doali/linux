#!/usr/bin/env bash

# Create a symbolic link on md2html.sh
# git-github [folder containing]
# - git clone https://github.com/doali/linux.git
# - and certainly more repositories

readonly SCRIPT=under2hyph
readonly TARGET=${HOME}/.local/bin

ln -snf ${HOME}/git-github/linux/ubuntu/bin/${SCRIPT}.sh ${TARGET}/${SCRIPT}
