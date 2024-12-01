---
title: Space Switching
date: 2024-11-20
draft: true
---

A space is a virtual desktop which helps you group application windows together.
- macOS - space
- Linux - workspace
- Windows - virtual desktop

Organizing application windows of the same type or purpose in the same space, and binding it to specific space numbers which you can use keyboard shortcuts to jump to, makes it effortless to context switch, especially if you're just working with one monitor on your laptop.

Before we start, you should set up the [Hyper Key]() (usually bound to caps lock) for the respective OS you're following this guide on, so you don't conflict with other keyboard shortcuts.

You can use a tiling window manager to achieve this as well, but using spaces is a great way for beginners to ease into it!
# Recommended layout
Heavily influenced by [Omakub](https://manual.omakub.org/1/read/8/navigation)'s recommended workspace layout, here's what I use for my spaces.

| #   | Purpose       | Program(s)                                | Hotkey      |
| --- | ------------- | ----------------------------------------- | ----------- |
| 1   | Browsing      | Edge                                      | `Hyper + 1` |
| 2   | Programming   | VSCode, Zed                               | `Hyper + 2` |
| 3   | Communication | Discord, WhatsApp                         | `Hyper + 3` |
| 4   | Terminal      | iTerm2                                    | `Hyper + 4` |
| 5   | Writing       | Obsidian                                  | `Hyper + 5` |
| 6   | Misc          | Spotify, Microsoft Remote Desktop, Parsec | `Hyper + 6` |
You can then use Alt + Tab to cycle between windows in a space.
# macOS
macOS has default keyboard shortcuts to switch spaces with ⌃ + n already, but I prefer reserving those combos instead. It also doesn't have shortcuts to move windows between spaces.

We'll be using ⌃ + ⌥ + ⌘ as the modifier in this example, but you can change it to caps lock or some other modifier.
## Disable system defaults
In Settings > Keyboard > Keyboard shortcuts > Mission control > Mission control, disable all the Switch to Desktop _n_ shortcuts.
## BetterTouchTool
Install BetterTouchTool (paid).

Add keyboard shortcuts for all apps, then add as many desktop switches and moves as you've got spaces.

| Shortcut | Action                          |
| -------- | ------------------------------- |
| ⌃⌥⌘1     | Switch to Desktop 1             |
| ⌃⌥⌘⇧1    | Move Window to Desktop 1        |
| ⌃⌥⌘`     | Maximize Window to Next Monitor |
You can probably do this with Karabiner Elements as well, for a free option.
## AltTab
Install AltTab

Bind ⌃⌥⌘Tab to a shortcut, then change

| Option                    | Value                 |
| ------------------------- | --------------------- |
| Show windows from Spaces  | Visible Spaces        |
| Show windows from screens | Screen showing AltTab |
| Show minimized windows    | Hide                  |
| Show hidden windows       | Hide                  |
## Spaceman
To get some UI indication of which space you're in, install [Spaceman](https://github.com/Jaysce/Spaceman), and you can add it to your menu bar.
# Windows
Virtual desktops are significantly more work to set up in Windows. It only comes with keyboard shortcuts to cycle between virtual desktops, with no support for switching specific virtual desktop numbers. There's no stable API for it as well, so be warned that the method below might not work after the latest Windows update (confirmed working on 23H2, for now)

We'll be using Ctrl + Alt + Win as the modifier in this example, but you can change it to caps lock or some other modifier.
## Configure system defaults
In Settings
- System > Multitasking
	- Snap windows
		- disable Show my snapped windows when I press Alt + Tab
	- disable showing tabs from apps when snapping or pressing Alt + Tab
	- Desktops
		- choose Only on the desktop I'm using for both options
- Personalization > Taskbar > Taskbar behaviors
	- Disable Show flashing on taskbar apps (your windows will flash when you switch desktops, but [VD.ahk](https://github.com/FuPeiJiang/VD.ahk) has a fix for it
## AutoHotkey
Install AutoHotkey v1.1 first, then v2.0 (so you can run any AHK script), then set up Ctrl + Alt + Win as your hyper key.
## windows-desktop-switcher
We'll be using [windows-desktop-switcher](https://github.com/pmb6tz/windows-desktop-switcher), which provides AHK v1.1 scripts to add keyboard shortcuts for virtual desktop switching.

Create a scripts folder on your PC, then download `desktop_switcher.ahk` and `user_config.ahk` to it. Next, grab the latest version of `VirtualDesktopAccessor.dll` from [here](https://github.com/Ciantic/VirtualDesktopAccessor/releases), as the one in the windows-desktop-switcher repo is outdated and doesn't work anymore.

TBD add include

Note that ^ is Ctrl, ! is Alt, # is Win and + is Shift.
```
#Include "desktop_switcher.ahk"

^!#+1:: MoveCurrentWindowToDesktop(0)
^!#+#+2:: MoveCurrentWindowToDesktop(1)
^!#+#+3:: MoveCurrentWindowToDesktop(2)
^!#+#+4:: MoveCurrentWindowToDesktop(3)
^!#+#+5:: MoveCurrentWindowToDesktop(4)
^!#+#+6:: MoveCurrentWindowToDesktop(5)
^!#+#+7:: MoveCurrentWindowToDesktop(6)
^!#+#+8:: MoveCurrentWindowToDesktop(7)
^!#+#+9:: MoveCurrentWindowToDesktop(8)

^!#1:: MoveOrGotoDesktopNumber(0)
^!#2:: MoveOrGotoDesktopNumber(1)
^!#3:: MoveOrGotoDesktopNumber(2)
^!#4:: MoveOrGotoDesktopNumber(3)
^!#5:: MoveOrGotoDesktopNumber(4)
^!#6:: MoveOrGotoDesktopNumber(5)
^!#7:: MoveOrGotoDesktopNumber(6)
^!#8:: MoveOrGotoDesktopNumber(7)
^!#9:: MoveOrGotoDesktopNumber(8)

^!#Tab::Send "!{Tab}"
```
Double click the `user_config.ahk` file to run it. To run this on startup, open the run dialog with Win + R, then type in `shell:startup` and place a shortcut to the script in this folder.
## WindowsVirtualDesktopHelper
To get some UI indication of which space you're in, install [WindowsVirtualDesktopHelper](https://github.com/dankrusi/WindowsVirtualDesktopHelper), and you can add it to your taskbar.
## Tips
Multiple monitors? In the task view, you can click on a window and select Show this window on all desktops, so it stays put when you switch desktops.