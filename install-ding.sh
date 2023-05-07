#!/bin/bash

# Define the name of the new command
COMMAND_NAME="ding"

# Define the path to the directory where the new command will be installed
INSTALL_DIR="/usr/local/bin"

# Define the URL of the script that implements the new command
SCRIPT_URL="https://raw.githubusercontent.com/coolcorexix/ding/30a668053ebd1973d351b2b0ea4ad760b612b358/ding.sh"
AUDIO_FILE_URL="https://github.com/coolcorexix/ding/raw/30a668053ebd1973d351b2b0ea4ad760b612b358/elevator-door-open.wav?raw=true"
AUDIO_FILE_NAME="elevator-door-open.wav"
BUZZ_AUDIO_FILE_URL="https://github.com/coolcorexix/ding/raw/30a668053ebd1973d351b2b0ea4ad760b612b358/buzz-sound.wav?raw=true"
BUZZ_AUDIO_FILE_NAME="buzz-sound.wav"

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

# Set the correct permissions for the new command
chmod +x "$INSTALL_DIR/$COMMAND_NAME"

# Display a message indicating that the installation was successful
echo "Installation of $COMMAND_NAME complete. You can now use '$COMMAND_NAME echo neat' to try out the command."
