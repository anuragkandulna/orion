#!/usr/bin/env bash

# Function to check if Python3 is already installed
check_python_installed() {
  if command -v python3 &> /dev/null
  then
    echo "Python 3 is already installed. Version: $(python3 --version)"
    exit 0

  elif command -v python &> /dev/null
  then
    echo "Python 3 is already installed. Version: $(python --version)"
    exit 0

  else
    echo "Python 3 is not installed. Proceeding with installation..."

  fi
}


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

