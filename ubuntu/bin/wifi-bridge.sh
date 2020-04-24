#!/usr/bin/env bash

if [ ${USER} == 'root' ]; then
  brctl addbr br0
  sudo iw dev wlp3s7 set 4addr on
  sudo brctl addif br0 wlp3s7
else
  echo "Need to be root"
fi
