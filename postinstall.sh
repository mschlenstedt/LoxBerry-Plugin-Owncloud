#!/bin/sh

# Bashscript which is executed by bash *AFTER* complete installation is done
# (but *BEFORE* postupdate). Use with caution and remember, that all systems
# may be different! Better to do this in your own Pluginscript if possible.
#
# Exit code must be 0 if executed successfull.
#
# Will be executed as user "loxberry".
#
# We add 5 arguments when executing the script:
# command <TEMPFOLDER> <NAME> <FOLDER> <VERSION> <BASEFOLDER>
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
ARGV5=$5 # Fifth argument is Base folder of LoxBerry

# Unzipping Owncloud Sources
echo "<INFO> Unzipping Owncloud Sources..."
/usr/bin/unzip -d $ARGV5/data/plugins/$ARGV3 $ARGV5/data/plugins/$ARGV3/owncloud.zip
echo "<INFO> Moving Dummy Config File to your Owncloud installation..."
shopt -s dotglob # Also copy hidden files (.something)
mv -v $ARGV5/data/plugins/$ARGV3/owncloud/* $ARGV5/webfrontend/html/plugins/$ARGV3/
shopt -u dotglob
rm -r -v $ARGV5/data/plugins/$ARGV3/owncloud
rm -r -v $ARGV5/data/plugins/$ARGV3/owncloud.zip

# Move Dummy Config file to installation and replacing dummy vars
echo "<INFO> Moving Dummy Config File to your Owncloud installation..."
mv -v $ARGV5/data/plugins/$ARGV3/config.php $ARGV5/webfrontend/html/plugins/$ARGV3/config/

/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:" $ARGV5/webfrontend/html/plugins/$ARGV3/config/config.php
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:" $ARGV5/webfrontend/html/plugins/$ARGV3/config/config.php

# Exit with Status 0
exit 0
