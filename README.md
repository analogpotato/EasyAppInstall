# EasyAppInstall
This repo will use either chocolatey or brew to install a series of favorite apps from a package manager


This command should run the powershell:

```
$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/analogpotato/EasyAppInstall/chocolatey/install.ps1
Invoke-Expression $($ScriptFromGitHub.Content)
```