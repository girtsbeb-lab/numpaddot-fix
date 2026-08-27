$ErrorActionPreference = "Stop"

$InstallFolder = Join-Path $env:LOCALAPPDATA "NumpadDotFix"
$ExeFile = Join-Path $InstallFolder "NumpadDotFix.exe"

New-Item -ItemType Directory -Path $InstallFolder -Force | Out-Null

Invoke-WebRequest `
    -Uri "https://raw.githubusercontent.com/girtsbeb-lab/numpaddot-fix/main/NumpadDotFix.exe" `
    -OutFile $ExeFile

New-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
    -Name "NumpadDotFix" `
    -Value "`"$ExeFile`"" `
    -PropertyType String `
    -Force | Out-Null

Start-Process $ExeFile

Write-Host "NumpadDotFix installed successfully."
