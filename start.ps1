New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx" -Name 'AllowDeploymentInSpecialProfiles' -Value 1 -PropertyType DWORD -Force | Out-Null
$ProgressPreference = 'SilentlyContinue'

Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install -y -f firefox microsoft-edge-insider-dev dotnet-6.0-sdk dotnet-8.0-sdk dotnetcore-3.1-sdk vscode git visualstudio-installer powershell-core