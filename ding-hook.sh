#!/bin/bash
# Claude Code hook script for ding
# Plays notification sounds when Claude Code events occur
#
# Supported events:
# - Stop: When Claude finishes responding
# - Notification: When Claude sends notifications (permission prompts, idle, etc.)

# Read JSON input from stdin (provided by Claude Code)
input=$(cat)

# Extract hook event name using grep/sed (works without jq)
hook_event_name=$(echo "$input" | grep -o '"hook_event_name"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"hook_event_name"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')

# Define sound playback function
play_sound() {
    local sound_file="$1"

    # Check if sound file exists in /usr/local/bin (installed location)
    if [[ -f "/usr/local/bin/$sound_file" ]]; then
        sound_path="/usr/local/bin/$sound_file"
    # Fallback to script directory (for development)
    elif [[ -f "$(dirname "$0")/$sound_file" ]]; then
        sound_path="$(dirname "$0")/$sound_file"
    else
        return 1
    fi

    # Play sound based on OS (use full paths for VSCode compatibility)
    if [[ "$(uname)" == "Darwin" ]]; then
        /usr/bin/afplay "$sound_path" &
    elif [[ "$(uname)" == "Linux" ]]; then
        /usr/bin/aplay "$sound_path" &
    fi
}

# Handle different hook events
case "$hook_event_name" in
    "Stop")
        # Claude finished responding - play success sound
        play_sound "bells-mindful.wav"
        ;;
    "Notification")
        # Claude sent a notification - play attention sound
        play_sound "wood_sound.wav"
        ;;
    *)
        # Unknown event - still succeed but don't play sound
        ;;
esac

# Return success with continue=true so Claude Code proceeds normally
echo '{"continue": true}'
exit 0
