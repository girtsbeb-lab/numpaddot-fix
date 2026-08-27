# NumPad Dot Fix
Fixes the numeric keypad decimal key to always output a dot (`.`) instead of a comma (`,`).
No administrator rights required.

## Install
```powershell
irm https://raw.githubusercontent.com/girtsbeb-lab/numpaddot-fix/main/install.ps1 | iex
```

## Uninstall
```powershell
irm https://raw.githubusercontent.com/girtsbeb-lab/numpaddot-fix/main/uninstall.ps1 | iex
```

## Installation Location
%LOCALAPPDATA%\NumpadDotFix


## How It Works
The installer:

1. Downloads `NumpadDotFix.exe` to:
   ```
   %LOCALAPPDATA%\NumpadDotFix
   ```
   
3. Creates a startup entry for the current user:
   ```
   HKCU\Software\Microsoft\Windows\CurrentVersion\Run
   ```
4. Starts the application immediately.

No administrator rights are required.

## Uninstall
Run:

```powershell
irm https://raw.githubusercontent.com/girtsbeb-lab/numpaddot-fix/main/uninstall.ps1 | iex
```

or manually remove:
- `%LOCALAPPDATA%\NumpadDotFix`
- `HKCU\Software\Microsoft\Windows\CurrentVersion\Run\NumpadDotFix`

## Windows SmartScreen

NumpadDotFix is a small open-source utility and is not code-signed.

Windows may display a SmartScreen warning when downloading or running the executable. You can review the source code in this repository before choosing to run it.

## License

MIT
