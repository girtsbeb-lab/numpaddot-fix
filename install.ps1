$ErrorActionPreference = "Stop"

$InstallFolder = Join-Path $env:LOCALAPPDATA "NumpadDotFix"
$ExeFile = Join-Path $InstallFolder "NumpadDotFix.exe"

# Latest release download URL
$DownloadUrl = "https://github.com/girtsbeb-lab/numpaddot-fix/releases/latest/download/NumpadDotFix.exe"

Write-Host "Installing NumpadDotFix..."

# Create installation folder
New-Item -ItemType Directory -Path $InstallFolder -Force | Out-Null

# Stop currently running instance
Get-Process NumpadDotFix -ErrorAction SilentlyContinue | Stop-Process -Force

# Download latest version
Write-Host "Downloading latest version..."
Invoke-WebRequest `
    -Uri $DownloadUrl `
    -OutFile $ExeFile

# Create startup entry
Write-Host "Configuring startup..."

New-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
    -Name "NumpadDotFix" `
    -Value "`"$ExeFile`"" `
    -PropertyType String `
    -Force | Out-Null

# Start application
Write-Host "Starting application..."
Start-Process $ExeFile

Write-Host ""
Write-Host "NumpadDotFix installed successfully."
Write-Host "Installation folder: $InstallFolder"
Write-Host "Startup configured for current user."
