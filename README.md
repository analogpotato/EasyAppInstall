# EasyAppInstall


I created this repo in order to make it easier to This repo will use either chocolatey or brew to install a series of favorite apps from a package manager


This command should run the powershell:

```
$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/analogpotato/EasyAppInstall/chocolatey/install.ps1
Invoke-Expression $($ScriptFromGitHub.Content)
```

For brew use:

```
curl -L https://raw.githubusercontent.com/analogpotato/EasyAppInstall/main/brew/install.sh -o ~/install.sh && chmod +x ~/install.sh && ~/install.sh
```