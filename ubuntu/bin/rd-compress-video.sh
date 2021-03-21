#!/usr/bin/bash

# https://gist.github.com/rene-d?direction=asc&sort=created
ffmpeg -i demo.avi -vcodec libx265 -movflags +faststart demo.mp4

