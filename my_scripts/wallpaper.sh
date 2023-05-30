#!/usr/bin/bash

file_path="$HOME/.mybg"
fallback_content="https://images.hdqwalls.com/download/the-exchange-street-4k-3y-3840x2400.jpg"

cat $file_path

# Check if the file exists
if [ -f "$file_path" ]; then
	echo $file_path
	# Read the contents of the file
	fehbg_contents=$(<"$file_path")

	# Check if the content is a valid URL
	if [[ $fehbg_contents =~ ^(https?|ftp):// ]]; then
		# Use the content from the file
		url=$fehbg_contents
	else
		# Use the fallback content
		url=$fallback_content
	fi
else
	echo $file_path
	# Use the fallback content
	url=$fallback_content
fi

# Run the feh command with the URL
feh --bg-fill "$url"
