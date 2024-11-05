#!/bin/bash

# Check if Python is available
if ! command -v python &> /dev/null; then
  echo "Error: Python is not installed or not in your PATH."
  exit 1
fi

# Get the mode argument (train or eval)
mode="$1"

# Validate the mode argument
if [[ ! "$mode" == "train" && ! "$mode" == "eval" ]]; then
  echo "Error: Invalid mode. Please specify 'train' or 'eval'."
  exit 1
fi

# Call the Python script with the mode argument
python run.py "$mode"

# Print success message
echo "Processed JSON data for mode: $mode"
