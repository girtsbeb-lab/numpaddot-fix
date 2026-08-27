Remove-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
    -Name "NumpadDotFix" `
    -ErrorAction SilentlyContinue

Get-Process NumpadDotFix -ErrorAction SilentlyContinue | Stop-Process -Force

Remove-Item `
    "$env:LOCALAPPDATA\NumpadDotFix" `
    -Recurse `
    -Force `
    -ErrorAction SilentlyContinue

Write-Host "NumpadDotFix removed."
