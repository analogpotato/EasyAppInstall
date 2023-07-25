#!/bin/bash

#!/bin/bash

# Step 1: Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "❌ Homebrew not found. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed ✅"
fi

# Step 2: Define the list of packages
packages=("visual-studio-code" "vlc" "spotify")

# Step 3: Install the packages
echo "🛠️ Installing packages..."
for package in "${packages[@]}"
do
    if brew list --formula | grep -q "^${package}\$"; then
        echo "$package is already installed ✅"
    else
        echo "🛠️ Installing $package..."
        brew install "$package" || echo "❌ Failed to install $package"
    fi
done
