# This script requires PowerShell version 3 or above

# Step 1: Check if Chocolatey is installed
try {
    choco -v | Out-Null
    Write-Host "Chocolatey is already installed"
}
catch {
    Write-Host "Chocolatey not found. Installing now..."
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Step 2: Get the location of the packages file
$userInput = Read-Host -Prompt "Enter the URL or local path to the packages file (or press Enter to use the default URL which is located at: https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/chocolatey/packages.txt):"
if (!$userInput) {
    # No input, use the default URL
    $Url = "https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/chocolatey/packages.txt"
    $output = "$env:temp\packages.txt"
    $Url = $Url -replace "github\.com", "raw.githubusercontent.com" -replace "/blob/", "/"
    Start-BitsTransfer -Source $Url -Destination $output
} elseif ($userInput -match '^https?://') {
    # Input is a URL, download the file
    $Url = $userInput -replace "github\.com", "raw.githubusercontent.com" -replace "/blob/", "/"
    $output = "$env:temp\packages.txt"
    Start-BitsTransfer -Source $Url -Destination $output
} else {
    # Input is a local path
    $output = $userInput
}

# Step 3: Read the contents of the file and install the packages
Get-Content $output | ForEach-Object {
    if (choco list --local-only | Select-String -Pattern "^$_ ") {
        Write-Host "$_ is already installed with Chocolatey"
    } elseif ((Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE (Name LIKE '%$_%')" -ErrorAction SilentlyContinue)) {
        Write-Host "$_ is already installed on the system"
    } else {
        Write-Host "Installing $_..."
        choco install $_ -y
    }
}
