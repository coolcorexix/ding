#!/bin/bash

# Define the name of the new command
COMMAND_NAME="ding"

# Define the path to the directory where the new command will be installed
INSTALL_DIR="/usr/local/bin"

# Define the URL of the script that implements the new command
SCRIPT_URL="https://raw.githubusercontent.com/coolcorexix/ding/adfb1eb7bcb17ec79c6acdb9826df717bcbae66e/ding.sh"
HOOK_SCRIPT_URL="https://raw.githubusercontent.com/coolcorexix/ding/master/ding-hook.sh"
HOOK_SCRIPT_NAME="ding-hook"
AUDIO_FILE_URL="https://github.com/coolcorexix/ding/raw/adfb1eb7bcb17ec79c6acdb9826df717bcbae66e/bells-mindful.wav?raw=true"
AUDIO_FILE_NAME="bells-mindful.wav"
BUZZ_AUDIO_FILE_URL="https://github.com/coolcorexix/ding/raw/adfb1eb7bcb17ec79c6acdb9826df717bcbae66e/wood_sound.wav?raw=true"
BUZZ_AUDIO_FILE_NAME="wood_sound.wav"

# Check if the command already exists in the installation directory
if [ -f "$INSTALL_DIR/$COMMAND_NAME" ]; then
    echo "Error: $COMMAND_NAME already exists in $INSTALL_DIR. Aborting installation."
    exit 1
fi

# Download the command script from the URL and write it to the installation directory
curl -sSL "$SCRIPT_URL" > "$INSTALL_DIR/$COMMAND_NAME"

# stop script if the download failed
if [ $? -ne 0 ]; then
    echo "Error: Failed to download $COMMAND_NAME from $SCRIPT_URL. Aborting installation."
    exit 1
fi

# Download a file from URL and write it to the installation directory
curl -sSL "$AUDIO_FILE_URL" > "$INSTALL_DIR/$AUDIO_FILE_NAME"

# Download a file from URL and write it to the installation directory
curl -sSL "$BUZZ_AUDIO_FILE_URL" > "$INSTALL_DIR/$BUZZ_AUDIO_FILE_NAME"


# stop script if the download failed
if [ $? -ne 0 ]; then
    echo "Error: Failed to download $AUDIO_FILE_NAME from $AUDIO_FILE_URL. Aborting installation."
    exit 1
fi

# Download the Claude Code hook script
curl -sSL "$HOOK_SCRIPT_URL" > "$INSTALL_DIR/$HOOK_SCRIPT_NAME"

if [ $? -ne 0 ]; then
    echo "Warning: Failed to download $HOOK_SCRIPT_NAME. Claude Code hook support will not be available."
else
    chmod +x "$INSTALL_DIR/$HOOK_SCRIPT_NAME"
    echo "Claude Code hook script installed as '$HOOK_SCRIPT_NAME'"
fi

# Set the correct permissions for the new command
chmod +x "$INSTALL_DIR/$COMMAND_NAME"

# Display a message indicating that the installation was successful
echo "Installation of $COMMAND_NAME complete. You can now use '$COMMAND_NAME echo neat' to try out the command."
echo ""
echo "For Claude Code integration, add this to your ~/.claude/settings.json:"
echo '  "hooks": {'
echo '    "Stop": [{"hooks": [{"type": "command", "command": "ding-hook"}]}],'
echo '    "Notification": [{"hooks": [{"type": "command", "command": "ding-hook"}]}]'
echo '  }'
