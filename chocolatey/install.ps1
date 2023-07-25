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

# Step 2: Download a file from GitHub
$defaultUrl = "https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/chocolatey/packages.txt"
$userUrl = Read-Host -Prompt "Enter the URL to the packages file (or press Enter to use the default URL which is located at: https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/chocolatey/packages.txt)"
$Url = if ($userUrl) { $userUrl -replace "github\.com", "raw.githubusercontent.com" -replace "/blob/", "/" } else { $defaultUrl }
$output = "$env:temp\packages.txt"
Start-BitsTransfer -Source $Url -Destination $output

# Step 3: Read the contents of the file and install the packages
Get-Content $output | ForEach-Object {
    choco install $_ -y
}
