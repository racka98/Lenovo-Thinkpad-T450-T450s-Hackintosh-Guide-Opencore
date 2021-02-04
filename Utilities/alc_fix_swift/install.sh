#!/bin/bash

#  install.sh
#  ALCPlugFix-Swift
#
#  Created by Nick on 10/14/20.
#  

# Get hold of actual directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
pledit=/usr/libexec/PlistBuddy

# Clean up old installs
function cleanUpOldInstall() {
    # Remove codec commander based ALCPlugFix
    sudo launchctl unload /Library/LaunchAgents/good.win.ALCPlugFix.plist
    sudo rm -rf /Library/LaunchAgents/good.win.ALCPlugFix.plist
    
    # Remove any existing alc-verb install
    sudo launchctl unload /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist
    sudo rm -rf /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist
}

# Function that exits with an error code and message
function abort() {
    echo $1
    exit 1
}

echo "**                                          **"
echo "** Installing ALCPlugFix (AppleALC variant) **"
echo "**                                          **"

echo ""
read -p "Please drag your config file to the terminal: " inputFile

# Verify the input file
if [[ ! -z $inputFile && -f $inputFile ]];  # If input exists and is of type 'file'
then
    # Verify if it is a correct PLIST file
    if /usr/bin/plutil "$inputFile" | grep -q "OK";
    then
        # Plist is valid, write the inputfile path to it
        $pledit -c "Set ProgramArguments:1 $inputFile" ./com.black-dragon74.ALCPlugFix.plist || abort "Failed to write to launchd plist"
    else
        abort "The provided file is not a valid plist"
    fi
else
    abort "Invalid input."
fi

# Set the logs to be ~/Library/Logs
#$pledit -c "Set StandardOutPath ${HOME}/Library/Logs/alcplugfix_stdout.log" ./com.black-dragon74.ALCPlugFix.plist || abort "Failed to write STDOUT logpath to plist"
#$pledit -c "Set StandardErrorPath ${HOME}/Library/Logs/alcplugfix_stderr.log" ./com.black-dragon74.ALCPlugFix.plist || abort "Failed to write STDERR logpath to plist"

echo ""

echo "**        Removing old installs             **"
cleanUpOldInstall 2>/dev/null

echo "**            Copying new files             **"
sudo cp "$DIR/ALCPlugFix-Swift" /usr/local/bin/ALCPlugFix || abort "Failed to copy ALCPlugFix"
sudo cp "$DIR/com.black-dragon74.ALCPlugFix.plist" /Library/LaunchAgents  || abort "Failed to copy launchd plist file"

echo "**          Setting permissions             **"
sudo chmod 755 /usr/local/bin/ALCPlugFix
sudo chmod 644 /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist

sudo chown root:wheel /usr/local/bin/ALCPlugFix
sudo chown root:wheel /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist

echo "**          Loading launch daemon           **"
sudo launchctl load /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist

echo "**                                          **"
echo "**             All done. Enjoy!             **"
echo "**                                          **"
