Remove-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
    -Name "NumpadDotFix" `
    -ErrorAction SilentlyContinue

Get-Process AutoHotkey -ErrorAction SilentlyContinue | Stop-Process -Force

$ScriptFolder = Join-Path $env:LOCALAPPDATA "NumpadDotFix"

Remove-Item `
    $ScriptFolder `
    -Recurse `
    -Force `
    -ErrorAction SilentlyContinue

Write-Host "NumpadDotFix removed."
