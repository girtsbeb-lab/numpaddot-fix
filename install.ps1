$ErrorActionPreference = "Stop"

$ScriptFolder = Join-Path $env:LOCALAPPDATA "NumpadDotFix"
$ScriptFile = Join-Path $ScriptFolder "NumpadDot.ahk"

Write-Host "Creating installation folder..."
New-Item -ItemType Directory -Path $ScriptFolder -Force | Out-Null

Write-Host "Checking AutoHotkey installation..."

$AhkExe = Get-ChildItem `
    "C:\Program Files*\AutoHotkey\v2\AutoHotkey*.exe" `
    -ErrorAction SilentlyContinue |
    Select-Object -First 1 -ExpandProperty FullName

if (-not $AhkExe) {
    Write-Host "Downloading AutoHotkey..."

    $Installer = Join-Path $env:TEMP "AutoHotkeyInstall.exe"

    Invoke-WebRequest `
        -Uri "https://www.autohotkey.com/download/ahk-v2.exe" `
        -OutFile $Installer

    Write-Host "Installing AutoHotkey..."
    Start-Process $Installer -ArgumentList "/S" -Wait

    Remove-Item $Installer -Force -ErrorAction SilentlyContinue

    $AhkExe = Get-ChildItem `
        "C:\Program Files*\AutoHotkey\v2\AutoHotkey*.exe" `
        -ErrorAction SilentlyContinue |
        Select-Object -First 1 -ExpandProperty FullName
}

if (-not $AhkExe) {
    throw "AutoHotkey installation failed."
}

Write-Host "Creating AutoHotkey script..."

@'
#Requires AutoHotkey v2.0
NumpadDot::Send(".")
'@ | Set-Content $ScriptFile -Encoding UTF8

Write-Host "Adding autostart entry..."

New-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
    -Name "NumpadDotFix" `
    -Value "`"$AhkExe`" `"$ScriptFile`"" `
    -PropertyType String `
    -Force | Out-Null

Get-Process AutoHotkey -ErrorAction SilentlyContinue | Stop-Process -Force

Start-Process $AhkExe -ArgumentList "`"$ScriptFile`""

Write-Host ""
Write-Host "SUCCESS"
Write-Host "NumPad decimal key now outputs '.' instead of ','."
