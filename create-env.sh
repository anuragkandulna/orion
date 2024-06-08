#!/usr/bin/env bash

# Function to check if python 3 is installed
check_python_installed() {
  if command -v python3 &> dev/null
  then
    echo "Python 3 is already installed. Version: $(python3 --version)"

  elif command -v python &> dev/null
  then
    echo "Python 3 is already installed. Version: $(python --version)"

  else
    echo "Python 3 is not installed. Please install Python 3."
    exit 1

  fi
}
