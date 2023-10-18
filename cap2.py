import sys
import shutil
import os

FullSearch = True

if len(sys.argv) < 2:
    print("Usage: python copy_file.py <partial_comment>")
    sys.exit(1)
partial_comment = sys.argv[1]

source_path = os.path.expanduser("~/Desktop/files")
destination_path = os.path.expanduser("~/Desktop/")

for file_name in os.listdir(source_path):
    src_path = os.path.join(source_path, file_name)
    with open(src_path, 'r') as file:
        if FullSearch == True:
            first_line = file.read()
        else:
            first_line = file.readline().strip()
    if partial_comment in first_line:
        dst_path = os.path.join(destination_path, file_name)
        shutil.copy(src_path, dst_path)
        print(f"File '{file_name}' copied successfully to the desktop!")
        break
else:
    print(
        f"Could not find file with partial comment '{partial_comment}' in the SourcePath.")
