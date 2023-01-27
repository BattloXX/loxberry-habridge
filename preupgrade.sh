#!/bin/sh

# To use important variables from command line use the following code:
COMMAND=$0    # Zero argument is shell command
PTEMPDIR=$1   # First argument is temp folder during install
PSHNAME=$2    # Second argument is Plugin-Name for scipts etc.
PDIR=$3       # Third argument is Plugin installation folder
PVERSION=$4   # Forth argument is Plugin version
#LBHOMEDIR=$5 # Comes from /etc/environment now. Fifth argument is
              # Base folder of LoxBerry
PTEMPPATH=$6  # Sixth argument is full temp path during install (see also $1)
 
# Combine them with /etc/environment
PCGI=$LBPCGI/$PDIR
PHTML=$LBPHTML/$PDIR
PTEMPL=$LBPTEMPL/$PDIR
PDATA=$LBPDATA/$PDIR
PLOG=$LBPLOG/$PDIR # Note! This is stored on a Ramdisk now!
PCONFIG=$LBPCONFIG/$PDIR
PSBIN=$LBPSBIN/$PDIR
PBIN=$LBPBIN/$PDIR

$PDATA/habridge stop

if [ ! -f "$5/data/plugins/$3/data/device.db" ]
then
	return 0
fi
echo "<INFO> Backup device.db"
cp $PDATA/data/device.db /tmp/p3-device.db

echo "<INFO> Getting habridge Sources from https://github.com"
#rm $PDATA/ha-bridge.jar
#/usr/bin/wget --progress=dot:mega -t 10 -O $PDATA/ha-bridge.jar https://github.com/BattloXX/loxberry-habridge/releases/download/0.3.6/ha-bridge-5.4.1-java11.jar
if [ ! -f $PDATA/ha-bridge.jar ]; then
    echo "<FAIL> Something went wrong while trying to download habridge Sources."
    exit 1
else
    echo "<OK> Habridge Sources downloaded successfully."
fi


# Exit with Status 0
exit 0
