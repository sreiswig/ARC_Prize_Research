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

# Get the backend argument (torch, jax, tensorflow)
backend="$2"

# Validate the backend argument
if [[ ! "$backend" == "torch" && ! "$backend" == "jax" && ! "$backend" == "tensorflow" ]]; then
  echo "Error: Invalid backend. Please specify 'torch', 'jax', or 'tensorflow'."
  exit 1
fi

# Set the KERAS_BACKEND environment variable
export KERAS_BACKEND=$backend

# Call the Python script with the mode argument
python run.py "$mode" "$backend"

# Print success message
echo "Processed JSON data for mode: $mode"
echo "Backend: $backend"
