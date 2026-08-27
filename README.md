NumPad Dot Fix
Replace the NumPad decimal/comma key with a dot (.) on Windows.

Designed for users of Latvian and other keyboard layouts where the numeric keypad decimal key produces a comma instead of a dot.

Features
No administrator rights required
Automatic AutoHotkey installation
Per-user installation
Starts automatically when you sign in
Small and lightweight
Installation
Open PowerShell and run:

irm https://raw.githubusercontent.com/girtsbeb-lab/numpaddot-fix/main/install.ps1 | iex
Uninstall
irm https://raw.githubusercontent.com/girtsbeb-lab/numpaddot-fix/main/uninstall.ps1 | iex
What It Does
Creates the following AutoHotkey script:

#Requires AutoHotkey v2.0
NumpadDot::Send(".")
and configures it to start automatically for the current user.

Installation Location
The script is stored in:

%LOCALAPPDATA%\NumpadDotFix
typically:

C:\Users\<username>\AppData\Local\NumpadDotFix
License
MIT
