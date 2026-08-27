$ErrorActionPreference = "SilentlyContinue"

Get-Process NumpadDotFix | Stop-Process -Force

Remove-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
    -Name "NumpadDotFix"

Remove-Item `
    "$env:LOCALAPPDATA\NumpadDotFix" `
    -Recurse `
    -Force

Write-Host "NumpadDotFix removed."
