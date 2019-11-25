#!/bin/sh

# Bash script which is executed by bash *BEFORE* installation is started (but
# *AFTER* preupdate). Use with caution and remember, that all systems may be
# different! Better to do this in your own Pluginscript if possible.
#
# Exit code must be 0 if executed successfull.
#
# Will be executed as user "loxberry".
#
# We add 4 arguments when executing the script:
# command <TEMPFOLDER> <NAME> <FOLDER> <VERSION>
#
# For logging, print to STDOUT. You can use the following tags for showing
# different colorized information during plugin installation:
#
# <OK> This was ok!"
# <INFO> This is just for your information."
# <WARNING> This is a warning!"
# <ERROR> This is an error!"
# <FAIL> This is a fail!"

# To use important variables from command line use the following code:
ARGV0=$0 # Zero argument is shell command
ARGV1=$1 # First argument is temp folder during install
ARGV2=$2 # Second argument is Plugin-Name for scipts etc.
ARGV3=$3 # Third argument is Plugin installation folder
ARGV4=$4 # Forth argument is Plugin version
echo "<INFO> Getting Owncloud Sourcen from https://download.owncloud.org"
#/usr/bin/wget --progress=dot:mega -t 10 -O /tmp/owncloud.zip https://download.owncloud.org/community/owncloud-9.1.1.zip
/usr/bin/wget --progress=dot:mega -t 10 -O /tmp/owncloud.zip https://download.owncloud.org/community/owncloud-10.3.1.zip
if [ ! -f /tmp/owncloud.zip ]; then
    echo "<FAIL> Something went wrong while trying to download Owncloud Sources."
    exit 1
else
    echo "<OK> Owncloud Soruces downloaded successfully."
fi

# Exit with Status 0
exit 0
