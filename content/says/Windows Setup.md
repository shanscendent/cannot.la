---
title: Windows Setup
date: 2024-12-05
draft: false
---
I use a Windows laptop for work, here are some apps and setup tips for a more pleasant experience.
# Installers
- [Ninite - Install or Update Multiple Apps at Once](https://ninite.com/)
	- Ninite is an installer that comes with multiple programs. I'd get these apps in order:
	- Firefox, 7-Zip, VLC, Spotify, Handbrake, Python x64 3, Notepad++, WinMerge, Visual Studio Code, RealVNC Viewer.
- [Browse the winget repository - winstall](https://winstall.app/)
	- Windows comes with the `winget` package manager by default. Use this site to find apps to install (winstall seems more updated compared to winget.run)
	- Helpful commands: `winget list`, `winget upgrade --all`
# Apps
## Developer
### Terminal
Windows Terminal is the best terminal app, which should be pre-installed.

Change Terminal > Settings > Startup > Default terminal application to Windows Terminal.
### WSL
Windows Subsystem for Linux is a very well integrated Linux VM in Windows. It makes using Windows for development bearable. In PowerShell, run
```
wsl --install
```
If you're interested in running GUI applications through WSLg, create a `.wslconfig` file in `%USERPROFILE%`, then add
```
[wsl2]
guiApplications=true
```
### MobaXterm
Some people prefer MobaXterm instead.
```
winget install -e --id Mobatek.MobaXterm
```
## Productivity utilities
### PowerToys
PowerToys Run is a Spotlight alternative. There's a bunch of other utilities included as well.
```
winget install -e --id Microsoft.PowerToys
```
### AutoHotkey
Run scripts with keyboard shortcuts or hotkeys.
```
winget install -e --id AutoHotkey.AutoHotkey
```
### Windows-Auto-Night-Mode
Toggle system-wide light and dark mode automatically, or with a keyboard shortcut.
```
winget install -e --id Armin2208.WindowsAutoNightMode
```
### Monitorian
Adjust brightness of DDC/CI enabled monitors easily.
```
winget install -e --id emoacht.Monitorian
```
### Fluent Search
Use your keyboard to navigate and click around on Windows, includes other utilities.
```
winget install -e --id BlastApps.FluentSearch
```
### Komorebi
Komorebi's the best Windows tiling window manager I've used. I've got a writeup on how to set it up [here](../komorebi).
## Note-taking
### Obsidian
Local first, markdown based note taking app.
```
winget install -e --id Obsidian.Obsidian
```
## Media
### OBS Studio
The best way to record your screen and/or layer other cameras.
```
winget install -e --id OBSProject.OBSStudio
```
### LosslessCut
The swiss army knife of lossless video/audio editing, [download](https://github.com/mifi/lossless-cut/releases/latest/download/LosslessCut-win-x64.7z)
# System settings
- In Settings > System > Multitasking, disable showing tabs from apps
- Change wallpaper to [Pepe Windows](https://i.redd.it/ysyxjx9yzhi61.png)
- In Settings > Bluetooth & devices > USB, disable USB battery saver if using laptop with a dock
# Tweaks
- If you need to open Bluetooth settings often to reconnect your earphones, create a shortcut called "bluetooth", then add this as the target
   ```
   %windir%\explorer.exe ms-settings:bluetooth
    ```
# Troubleshooting
## Proxy
Winget or other applications may not work behind a corporate proxy. To fix this, go to Edit the system environment variables, then add `HTTP_PROXY` and `HTTPS_PROXY` to your system variables. Restart those apps afterwards.
## VPN
Your WSL instance might lose network connectivity if connected to a VPN like GlobalProtect. To fix, run [wsl-vpnkit](https://github.com/sakai135/wsl-vpnkit), and enable the systemd service.
## Running powershell scripts
If you can't run any powershell scripts, enable execution of local scripts.
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
## Other troubleshooting references
If you run into errors, these links may help
- https://github.com/microsoft/winget-cli/issues/1826