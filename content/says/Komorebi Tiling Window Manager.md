---
title: Komorebi Tiling Window Manager
date: 2024-11-28
draft: false
---

Windows' virtual desktop feature is a hot mess. After struggling to configure AutoHotkey and DLLs to try and make virtual desktops work properly with shortcuts, I gave up and tried [Komorebi](https://lgug2z.github.io/komorebi/) instead, after disliking GlazeWM in the past. I have to say, it's been a pleasant experience!

Komorebi comes with a hotkey daemon to trigger commands, a tiling wm, and a status bar

Here's how to get started, plus my example configuration
# Prerequisites
Note that komorebi actually comes with whkd (a simple hotkey daemon), but we'll be using [AutoHotkey](https://www.autohotkey.com/) v2.0 in this tutorial instead for hotkeys (wkhd doesn't support the Win key as a modifier). If you want existing compatibility with AHK v1.1 scripts, install v1.1 before you install v2.0, they'll coexist together

I'd recommend setting your taskbar to auto-hide since there's already a status bar
# Komorebi
## Installation
First, enable long path support in a PowerShell window with admin rights
```PowerShell
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
```

Then close that window

Disable unnecessary system animations in Settings > Accessibility > Visual effects > Animation effects

Open a new PowerShell window, then install komorebi using winget
```PowerShell
winget install LGUG2Z.komorebi
```

Restart your terminal for the command to take effect

Download the example configuration files to your USERPROFILE, create a PowerShell profile script
```PowerShell
komorebic quickstart
if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
}
```

To figure out where the profile script is, run `$PROFILE` in PowerShell. Then, add
```PowerShell
$Env:KOMOREBI_AHK_EXE = "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe"
```
to the script. This tells komorebi where the AHK executable is

Create a `komorebi.ahk` file in your USERPROFILE, then paste the contents of the file [here](https://lgug2z.github.io/komorebi/common-workflows/autohotkey.html), since we're not using wkhd.

Enable autostart
```PowerShell
komorebic enable-autostart --ahk --bar
```

You're now ready to get started with komorebi!
## Usage
Start and stop komorebi
```PowerShell
komorebic start --ahk --bar
komorebic stop
```
## Customization
Edit these files (in USERPROFILE) for customization. If komorebi is running, it should auto reload, but will silently fail on config errors. Stop and start it again, and you should see errors when it starts. Configuration and bar reference in the [docs](https://lgug2z.github.io/)
### `komorebi.ahk`
It uses Alt by default, but I've bound my caps lock key as my hyper key, so I use all modifier keys `^!#a` as modifiers. Customize the hotkeys as you see fit.

Some extra [commands](https://lgug2z.github.io/komorebi/cli/quickstart.html) that you may find useful binding, for a multi monitor setup
- focus-monitor
- cycle-send-to-monitor
### `komorebi.json`
- change `default_workspace_padding` and `default_container_padding` to 0, as big borders are distracting. You can reduce `border_width` as well
- set `stackbar.mode` to `Never`, as it takes up a lot of space
- you can customize `border_colours` and `theme`, refer to [catppuccin](https://catppuccin.com/palette) for palettes and colours
- tiling [layouts](https://lgug2z.github.io/komorebi/example-configurations.html#layouts): my favourite workspace layout is `VerticalStack`, so I've set all of the workspaces (virtual desktops) to that instead
- configure multiple monitors
	- [set display index](https://lgug2z.github.io/komorebi/common-workflows/set-display-index.html) (run command while komorebi is running)
	- configure workspaces according to monitor order
### `komorebi.bar.json`
It's nice out of the box, so I only changed the theme.
### Window pinning

# References
- https://lgug2z.github.io/komorebi/installation.html
- https://learn.microsoft.com/en-us/powershell/scripting/learn/shell/creating-profiles?view=powershell-7.4