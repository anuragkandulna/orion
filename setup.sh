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


# Function to install homebrew
install_homebrew() {
	echo "Homebrew not found. Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}


# Function to install Python on MacOS
install_python_on_mac() {
  # Check if Python is already installed
	check_python_installed

	# Install Homebrew if not found
	if ! command -v brew &> /dev/null
	then
		install_homebrew
	else
		echo "Homebrew is already installed"
	fi

	# Update Homebrew
	echo "Updating Homebrew..."
	brew update

	# Install latest version of Python 3.12
	echo "Installing latest version of Python 3.12 ..."
	brew install python@3.12

	# Verify the installation
	echo "Verify the Python installation..."
	python3 --version

	if [ $? -eq 0 ]; then
		echo "Python 3 installation was successful."
	else
		echo "Python 3 installation failed."
		exit 1
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

