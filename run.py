import json
import os
import argparse

def read_json_from_directory(directory_path):
    """Reads JSON files from a given directory and its subdirectories.
    
    Args:
        directory_path: The path to the root directory.

    Returns:
        A list of JSON objects
    """
    
    json_data = []
    for root, _, files in os.walk(directory_path):
        for file in files:
            if file.endswith('.json'):
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as f:
                    data = json.load(f)
                    json_data.append(data)

    return json_data

def main():
    parser = argparse.ArgumentParser(description="Process JSON data from a directory.")
    parser.add_argument("mode", choices=["train", "eval"], help="Specify the mode: train or eval")
    args = parser.parse_args()

    root_directory = 'data'
    data_directory = ""
    if args.mode == "train":
        data_directory = os.path.join(root_directory, "training")
    elif args.mode == "eval":
        data_directory = os.path.join(root_directory, "evaluation")
    else:
        raise ValueError("Invalid mode specified")

    json_data = read_json_from_directory(data_directory)

    # Now you can process the JSON data
    for data in json_data:
        print(data)

if __name__ == "__main__":
    main()
