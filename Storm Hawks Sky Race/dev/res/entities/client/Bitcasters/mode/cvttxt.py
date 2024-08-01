import os

def convert_py_to_txt(directory, output_folder):
    # Create the output folder if it does not exist
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Walk through the directory and its subdirectories
    for root, dirs, files in os.walk(directory):
        for filename in files:
            if filename.endswith(".py"):
                # Construct the full file path
                file_path = os.path.join(root, filename)

                # Read the .py file
                with open(file_path, 'r') as file:
                    content = file.read()

                # Create a path for the new .txt file
                relative_path = os.path.relpath(root, directory)
                new_filename = filename.replace(".py", ".txt")
                new_file_path = os.path.join(output_folder, relative_path, new_filename)

                # Create subdirectories in the output folder if they don't exist
                if not os.path.exists(os.path.dirname(new_file_path)):
                    os.makedirs(os.path.dirname(new_file_path))

                # Write the content to the .txt file
                with open(new_file_path, 'w') as file:
                    file.write(content)
                print("Converted {} to {}".format(file_path, new_file_path))

# Use this to convert all .py files in the current directory and its subdirectories
convert_py_to_txt('.', 'txt')
