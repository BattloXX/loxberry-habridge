#!/bin/sh

# Bash script which is executed by bash *BEFORE* installation is started (but
# *AFTER* preupdate). Use with caution and remember, that all systems may be
# different! Better to do this in your own Pluginscript if possible.
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
echo "<INFO> Command is: $ARGV0"

ARGV1=$1 # First argument is temp folder during install
echo "<INFO> Temporary folder is: $ARGV1"

ARGV2=$2 # Second argument is Plugin-Name for scipts etc.
echo "<INFO> (Short) Name is: $ARGV2"

ARGV3=$3 # Third argument is Plugin installation folder
echo "<INFO> Installation folder is: $ARGV3"

ARGV4=$4 # Forth argument is Plugin version
echo "<INFO> Installation folder is: $ARGV4"

ARGV5=$5 # Fifth argument is Base folder of LoxBerry
echo "<INFO> Base folder is: $ARGV5"


# Download
echo "<INFO> Getting habridge Sources from https://github.com"
mkdir -p /opt/loxberry/data/plugins/p3_lox_habridge/
/usr/bin/wget --progress=dot:mega -t 10 -O /opt/loxberry/data/plugins/p3_lox_habridge/ha-bridge.jar https://github.com/BattloXX/loxberry-habridge/releases/download/0.3.5RC5/ha-bridge-5.3.1RC5-java11.jar
if [ ! -f /opt/loxberry/data/plugins/p3_lox_habridge/ha-bridge.jar ]; then   
   echo "<FAIL> Something went wrong while trying to download habridge Sources."
    exit 1
else
    echo "<OK> Habridge Sources downloaded successfully."
fi

# Exit with Status 0
exit 0
