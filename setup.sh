#!/usr/bin/env bash

# Simple script to initial setup

PLATFORM="$(uname)"
echo $PLATFORM

if [ "$PLATFORM" == "Darwin" ]; then
	echo "Mac OS X detected"
elif [ "$PLATFORM" == "Linux" ]; then
	echo "Linux detected"
elif [ "$PLATFORM" == "MINGW*" ]; then
	echo "Windows detected"
else
	echo "Unrecognized platform detected"
fi

