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

chmod 755 $5/data/plugins/$3/habridge

if [ ! -f "/tmp/p3-device.db" ]
then
	return 0
fi

echo "<INFO> Recover device.db backup"
mkdir -p $5/data/plugins/$3/data/
cp /tmp/p3-device.db $5/data/plugins/$3/data/device.db
rm -f /tmp/p3-device.db

#start once with root

#nohup java -jar -Dserver.port=8080 -Dconfig.file=/opt/loxberry/data/plugins/p3_lox_habridge/habridge.config /opt/loxberry/data/plugins/p3_lox_habridge/ha-bridge.jar

# Exit with Status 0
exit 0
