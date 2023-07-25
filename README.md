# EasyAppInstall

## 😀 Purpose

"EasyAppInstall" is a tool created to simplify and automate the process of installing your favorite applications on a new machine. Whether you're a developer, a system admin, or an individual user, this project is designed with you in mind. Utilizing the power of package managers - [Homebrew](https://brew.sh/) for macOS and [Chocolatey](https://chocolatey.org/) for Windows 10/11 - it automates not only the installation of a suite of applications but also ensures the package managers themselves are installed, offering a near one-click solution.

What sets EasyAppInstall apart is its flexibility and modularity. The list of applications to be installed is maintained in a simple package text file, which can be easily customized according to each user's needs. Want to maintain your own list of packages in a remote location? The script can prompt for a custom URL to your package text file. In essence, EasyAppInstall makes setting up your essential software a breeze, regardless of whether you're on a Mac or Windows machine.

## 📃 Features
- **Cross-Platform Support:** The scripts provided in this repository are designed to work on both Windows (using PowerShell and Chocolatey) and macOS (using zsh and Homebrew), allowing for easy package installation on either platform.

- **Easy Package Configuration:** Packages to be installed are listed in a simple package text file, making it easy for users to customize which packages are installed by the script. Users can fork the repository and modify this file to suit their needs.

- **Automatic Package Manager Installation:** If the required package manager (Chocolatey or Homebrew) is not already installed on the system, the script will automatically download and install it.

- **Package Installation:** The script automatically installs a list of software packages on the user's system. On Windows, it uses Chocolatey to install the packages, and on macOS, it uses Homebrew.

- **User URL Input:** The PowerShell script prompts the user to enter a URL for their own package text file if they wish, allowing users to maintain their own list of packages in a remote location.

- **GitHub URL Parsing:** If a user provides a URL to a package text file on GitHub, the PowerShell script can parse it from a standard GitHub URL to a raw.githubusercontent.com URL suitable for direct file download.

- **Run from a local txt file:** Your package list just needs to be a text file locally! Easy to setup and easy to share.

- **Skip Already Installed Packages:** The scripts check whether each package is already installed before attempting installation, avoiding unnecessary operations.

- **One-Click/One-Line Execution:** The scripts can be downloaded and executed in a single line of code, making it easy for users to run.

## 🛠️ How to use EasyAppInstall

### Creating a package text file

The package text file is a simple text file that lists the packages you want to install. Each package name should be on a new line. Here's how you can create one:

Open any text editor of your choice.

On each new line, write the name of a package you wish to install. Make sure to use the exact package name as recognized by Homebrew or Chocolatey. For example, if you're creating a package text for Homebrew, and you want to install Visual Studio Code, VLC, and Spotify, your package text file should look like this:

```
visual-studio-code
vlc
spotify
```
Save the file with an easy to remember name like `packages.txt`.

You can host this package text file locally or via a github URL.

### For Windows:

1. **Open PowerShell:** Right-click the start button and select "Windows PowerShell" from the context menu. If you see "Command Prompt" instead of "Windows PowerShell", you can choose that.

2. **Run the Script:** Copy and paste the following command into PowerShell and press Enter:

```
iwr -useb https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/chocolatey/install.ps1 | iex
```

When prompted, enter the URL to your own `packages.txt` file hosted on Github or the path to a local text file on your computer if you have one, or press Enter to use the default located in the /chocolatey/packages.txt folder in this repo.

### For macOS:

1. **Open Terminal:** You can do this by searching for "Terminal" in Spotlight (the magnifying glass in the top-right corner of the screen).

2. **Run the Script:** Copy and paste the following command into Terminal and press Enter:

```
curl -L https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/brew/install.sh -o ~/install.sh && chmod +x ~/install.sh && ~/install.sh
```
When prompted, enter the URL to your own `packages.txt` file hosted on Github or the path to a local text file on your computer if you have one, or press Enter to use the default located in the /brew/packages.txt folder in this repo.

That's it! The script will automatically install the listed packages using the appropriate package manager (Chocolatey for Windows, Homebrew for macOS). If the package manager is not already installed, the script will install it first. If you provided a custom package text file, the script will install the packages listed in that file.

## ⚠️ Current issues

- The MacOS script currently doesn't support an alternative Github link, I'm working to fix that.
- More error handling is needed, I'm very green to this kind of scripting 😅

## 🤝 Contribute
- If you would like to contribute, please throw me a PR or log an issue! This is a super part time thing for me, so if you have any suggestions I will do my best to respond.