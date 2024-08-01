import os
import json

def find_pyc_files(directory, json_output):
    pyc_files = {}
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".pyc"):
                full_path = os.path.join(root, file)
                pyc_files[file] = full_path

    with open(json_output, 'w') as json_file:
        json.dump(pyc_files, json_file, indent=4)

# Usage
directory_to_search = './'  # Replace with your directory path
json_output = 'pyc_files.json'
find_pyc_files(directory_to_search, json_output)
