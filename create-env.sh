#!/usr/bin/env bash

# Function to check if python 3 is installed
check_python_installed() {
  if command -v python3 &> /dev/null
  then
    echo "Python 3 is already installed. Version: $(python3 --version)"

  elif command -v python &> /dev/null
  then
    echo "Python 3 is already installed. Version: $(python --version)"

  else
    echo "Python 3 is not installed. Please install Python 3."
    exit 1
  fi

create_virtualenv() {
  local ENV="py-env-3.12"

  # Cleaning up local v-environment
  if [ -d $ENV ]; then
    echo "Python Virtual environment ${ENV} already exist. Cleaning up the environment..."
    rm -rf
    echo "Successfully cleared the old environment..."
  fi

  # Creating a new environment
  echo "Creating new virtual environment..."
  if command -v python3 &> /dev/null
  then
    python3 -m venv $ENV

  else
    python -m venv $ENV
  fi

  # Verify environment creation was success
  if [ $? -eq 0 ]; then
    echo "Successfully created virtual environment in directory: ${ENV}"

  else
    echo "Failed to create virtual environment. Exiting now!"
    exit 1
  fi

}
