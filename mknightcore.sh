#!/bin/sh

PITCH=-720
SPEED=2.35
BASS=+10
VOLUME=0.9
FILE=""
OUTFILE=""
while [ ${#*} -gt 0 ]
do
	if [ "$1" == "-p" ]
	then
		PITCH="$2"
		shift 2
	elif [ "$1" == "-s" ]
	then
		SPEED="$2"
		shift 2
	elif [ "$1" == "-b" ]
	then
		BASS="$2"
		shift 2
	elif [ "$1" == "-o" ]
	then
		OUTFILE="$2"
		shift 2
	elif [ "$1" == "-v" ]
	then
		VOLUME="$2"
		shift 2
	else
		FILE="$1"
		shift 1
	fi
done
if [ -z "$FILE" ]
then
	exit 1
fi
if [ -z "$OUTFILE" ]
then
	OUTFILE="NIGHTCORE_$FILE"
fi

echo
echo "Nightcoreifying $FILE to $OUTFILE"
echo "Gruesomenessparameters: speed $SPEED, pitch $PITCH, bass $BASS, volume $VOLUME"
echo -e "\t***May the gods have mercy***"
echo

sox -S "$FILE" "$OUTFILE" speed "$SPEED" pitch "$PITCH" bass "$BASS" vol "$VOLUME"
STAT=$?

echo
if [ $STAT -eq 0 ]
then
	echo "Finished successfully"
	echo -e "\t ROT IN HELL"
else
	echo "sox failed"
	echo "Spin cylinder again? <yna>"
fi
