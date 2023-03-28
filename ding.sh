#!/bin/zsh

$@

# if the command is run on mac use this script
if [ "$(uname)" == "Darwin" ]; then
    # play the sound
    afplay /usr/local/bin/elevator-door-open.wav
fi

# if the command is run on linux use this script
if [ "$(uname)" == "Linux" ]; then
    # play the sound
    aplay /usr/local/bin/elevator-door-open.wav
fi




