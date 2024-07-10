#!/bin/bash
$@

# get the exit code of the last command
exit_code=$?

# define a function to play the sound with filename as param of function
function play_sound {
    # if the command is run on mac use this script
    if [[ "$(uname)" == "Darwin" ]]; then
        # play the sound
        afplay /usr/local/bin/$1
    fi

    # if the command is run on linux use this script
    if [[ "$(uname)" == "Linux" ]]; then
        # play the sound
        aplay /usr/local/bin/$1
    fi
}

if [[ $exit_code -ne 0 ]]; then
    # play the sound
    play_sound wood-sound.wav
    # stop the script right here
    exit $exit_code
fi

play_sound bells-mindful.wav