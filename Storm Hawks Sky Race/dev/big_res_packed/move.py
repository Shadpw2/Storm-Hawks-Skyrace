import json
import os
import shutil

def move_py_files(json_input, py_files_directory):
    with open(json_input, 'r') as json_file:
        pyc_files = json.load(json_file)

    for pyc_file, pyc_path in pyc_files.items():
        py_file = pyc_file.replace('.pyc', '.py')
        py_file_path = os.path.join(py_files_directory, py_file)

        if os.path.exists(py_file_path):
            new_location = os.path.join(os.path.dirname(pyc_path), py_file)
            shutil.move(py_file_path, new_location)
            print("Moved {0} from {1} to {2}".format(py_file, py_file_path, new_location))
        else:
            print("{0} not found in {1}".format(py_file, py_files_directory))

# Usage
json_input = 'pyc_files.json'
py_files_directory = 'C:\OutputDirectory'  # Replace with your .py files directory path
move_py_files(json_input, py_files_directory)
