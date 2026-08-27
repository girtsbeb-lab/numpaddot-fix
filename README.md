# NumPad Dot Fix
Fixes the numeric keypad decimal key to always output a dot (`.`) instead of a comma (`,`).
No administrator rights required.

## Install
irm https://raw.githubusercontent.com/girtsbeb-lab/numpaddot-fix/main/install.ps1 | iex


## Uninstall
irm https://raw.githubusercontent.com/girtsbeb-lab/numpaddot-fix/main/uninstall.ps1 | iex


## Installation Location
%LOCALAPPDATA%\NumpadDotFix


## How It Works
The installer:

1. Downloads `NumpadDotFix.exe` to:
   %LOCALAPPDATA%\NumpadDotFix

2. Creates a startup entry for the current user:
   HKCU\Software\Microsoft\Windows\CurrentVersion\Run

3. Starts the application immediately.

No administrator rights are required.

## License

MIT
