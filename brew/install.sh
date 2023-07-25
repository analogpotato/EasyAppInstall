#!/bin/bash

# Step 1: Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed"
fi

# Step 2: Download a file from GitHub
default_url="https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/brew/packages.txt"
echo "Enter the URL to the packages file (or press Enter to use the default URL):"
read user_url
url=${user_url:-$default_url}

output="/tmp/packages.txt"
curl -L $url -o $output

# Convert Windows line endings to Unix line endings
sed -i '' 's/\r$//' "$output"

# Step 3: Read the contents of the file and install the packages
echo "Contents of $output:"
cat "$output"

if [[ -s "$output" ]]; then
    echo "Installing packages..."
    while IFS= read -r package
    do
        echo "Installing $package..."
        brew install "$package" || echo "Failed to install $package"
    done < "$output"
else
    echo "No packages to install. The file is empty."
fi
