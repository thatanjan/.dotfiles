#!/usr/bin/python3
import json
import os

def read_colors_json():
    home_dir = os.path.expanduser("~")
    colors_file_path = os.path.join(home_dir, ".cache", "wal", "colors.json")

    with open(colors_file_path) as file:
        data = json.load(file)

    return data

def create_string(data):
    background = data.get("special").get("background")
    foreground = data.get("special").get("foreground")
    active_color = data.get("colors").get("color4")

    result = "* {\n"
    result += f"  background: {background};\n"
    result += f"  foreground: {foreground};\n"
    result += f"  active: {active_color};\n"
    result += "}"

    return result

# Read colors.json and create the string
colors_data = read_colors_json()
result_string = create_string(colors_data)

# Specify the file path
home_dir = os.path.expanduser("~")
output_dir = os.path.join(home_dir, ".cache", "wal")
output_file_path = os.path.join(output_dir, "my-custom-rofi.rasi")

# Write the resulting string to the file
with open(output_file_path, "w") as file:
    file.write(result_string)

print(f"Output file created: {output_file_path}")
print(result_string)
