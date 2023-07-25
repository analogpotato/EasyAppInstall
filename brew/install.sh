#!/bin/bash

# Step 1: Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "❌ Homebrew not found. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed ✅"
fi

# Step 2: Get the location of the packages file
echo "Enter the URL or local path to the packages file (or press Enter to use the default URL which is located at: https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/brew/packages.txt):"
read user_input
if [ -z "$user_input" ]
then
    # No input, use the default URL
    url="https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/brew/packages.txt"
    output="/tmp/packages.txt"
    curl -L $url -o $output
elif [[ $user_input == http* ]]
then
    # Input is a URL, download the file
    url=$user_input
    output="/tmp/packages.txt"
    curl -L $url -o $output
else
    # Input is a local path
    output=$user_input
fi

# Convert Windows line endings to Unix line endings
sed -i '' 's/\r$//' "$output"

# Step 3: Read the contents of the file and install the packages
echo "🛠️ Installing packages..."
if [[ -s "$output" ]]; then
    while IFS= read -r package
    do
        if brew list | grep -q "^${package}\$"; then
            echo "$package is already installed ✅"
        else
            echo "🛠️ Installing $package..."
            brew install "$package" || echo "❌ Failed to install $package"
        fi
    done < "$output"
else
    echo "No packages to install. The file is empty or does not exist."
fi
