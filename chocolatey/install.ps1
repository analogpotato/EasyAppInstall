# This script requires PowerShell version 3 or above

$local_temp = "C:\Users\spudl\AppData\Local\Temp\package.txt"

# Step 1: Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Step 2: Download a file from GitHub
$Url = "https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/chocolatey/install.ps1" # replace this with your file URL
$output = $local_temp
Invoke-WebRequest -Uri $Url -OutFile $output

# # Step 3: Read the contents of the file and install the packages
# Get-Content $output | ForEach-Object {
#     choco install $_ -y  # the -y flag automatically confirms all prompts
# }
