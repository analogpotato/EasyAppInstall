#!/bin/bash

# Step 1: Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "❌ Homebrew not found. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed ✅"
fi

# Step 2: Download the list of packages from GitHub
url="https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/brew/packages.txt"  # replace this with your file URL
output="/tmp/packages.txt"
curl -L $url -o $output

# Read the file into an array
readarray -t packages < "$output"

# Step 3: Install the packages
echo "🛠️ Installing packages..."
for package in "${packages[@]}"
do
    if brew list | grep -q "^${package}\$"; then
        echo "$package is already installed with Homebrew ✅"
    else
        echo "🛠️ Installing $package..."
        brew install "$package" || echo "❌ Failed to install $package"
    fi
done
