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
}


# Function to install Python on Linux
install_python_on_linux() {
  # Check if Python is already installed
  check_python_installed

  # Update the packages
  echo "Updating the package list..."
  sudo apt update

  # Install prerequisites
  echo "Installing prerequisites..."
  sudo apt install -y software-properties-common

  # Add deadsnakes PPA for newer versions of Python
  echo "Adding deadsnakes PPA..."
  sudo add-apt-repository ppa:deadsnakes/ppa -y

  # Update the packages again
  echo "Updating the packages list again..."
  sudo apt update

  # Install latest version of Python 3
  echo "Installing latest version of Python 3..."
  sudo apt install -y python@3.12
}


# ------------------------------------------ START HERE ----------------------------------------- #
# Check the platform and based on it, start installation of python
PLATFORM="$(uname)"
echo $PLATFORM

if [ "$PLATFORM" == "Darwin" ]; then
	echo "MacOS platform detected..."
	install_python_on_mac

elif [ "$PLATFORM" == "Linux" ]; then
	echo "Linux platform detected..."
	install_python_on_linux

elif [ "$PLATFORM" == "MINGW*" ]; then
	echo "Windows platform detected..."
	echo "Python installation using CLI is unsupported. Please proceed from python website for manual steps..."
	exit 0

else
	echo "Unrecognized platform detected. Exiting with error code 1..."
	exit 1
fi


# Verify Python after installation
echo "Verify the Python installation..."
python3 --version

if [ $? -eq 0 ]; then
	echo "Python 3 installation was successful."
else
	echo "Python 3 installation failed."
	exit 1
fi
