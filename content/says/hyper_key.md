+++
title = 'Hyper Key'
date = 2024-11-24
draft = false
+++

A hyper key is a trigger to hold down all of the standard modifiers on your keyboard. 
- macOS: ⌃ + ⌥ + ⇧ + ⌘
- Linux: Ctrl + Alt + Shift + Super
- Windows: Ctrl + Alt + Shift + Win

You can remap it to the any of the keys you don't use often on your keyboard, like the caps lock key, or the modifier keys on the right. This creates an extra modifier that _usually_ doesn't conflict with any default keyboard shortcuts, as it's quite impractical to hold down this many modifiers!

It's also possible to maintain the original key behaviour when you tap instead of hold that key, so there's nothing to lose.

Variants: you can also have a "meh" key (⌃ + ⌥ + ⇧), which lets you chain ⌘, or what I call a shift-less hyper key (⌃ + ⌥ + ⌘), which lets you chain ⇧ instead.

If you're lazy and just want predefined shortcuts for macOS and Windows, check out [Capslock](https://github.com/Vonng/Capslock/tree/master)

Otherwise, go ahead and use the hyper key for your own custom keyboard shortcuts!
# macOS
Some of the most popular methods to set up a hyper key on macOS are [Hyperkey](https://hyperkey.app/), [BetterTouchTool](https://folivora.ai/) or [Karabiner Elements](https://karabiner-elements.pqrs.org/). 

Hyperkey is the easiest, with BetterTouchTool coming in at a close second. However, they don't work properly on my machine, for some reason. Karabiner Elements needed a bit more effort, but it works reliably for me.
## Disable the default shortcuts
But first, let's disable the conflicting macOS default keyboard shortcut: System Settings > Keyboard > Keyboard Shortcuts > Services > Text > Convert Text to Simplified Chinese.
## Karabiner Elements
Install Karabiner Elements
```bash
brew install --cask karabiner-elements
```

In the settings, add a new rule in Complex Modifications:
```json
{
    "manipulators": [
        {
            "description": "Change caps_lock to esc if alone, command+control+option if held",
            "from": {
                "key_code": "caps_lock",
                "modifiers": { "optional": ["any"] }
            },
            "to": [
                {
                    "key_code": "left_command",
                    "modifiers": ["left_control", "left_option"]
                }
            ],
            "to_if_alone": [{ "key_code": "escape" }],
            "type": "basic"
        }
    ]
}
```
This rule sets up caps lock as esc when tapped, and the shift-less hyper key when held.
### Customization
- To switch to the full hyper key, change `key_code` to `left_shift`, and add `left_command` to `modifiers`.
- If you do use caps lock, switch `to_if_alone`'s `key_code` to `caps_lock`
# Windows
In addition to [AutoHotkey](https://www.autohotkey.com/), [PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/) has support for key remapping as well. However, I don't think you can rebind just modifiers in PowerToys, it only supports full combos.
## Disable the default shortcuts
Windows actually has Ctrl + Alt + Shift + Win bound to Office by default. To disable it, follow the instructions in [OfficeKeyFix](https://github.com/acook/OfficeKeyFix)
## AutoHotkey
Download and install AutoHotkey v2.0.

Create a folder somewhere on your system to store the AutoHotkey script, then create a `caps.ahk` file (credit to [D_Liver on SO](https://stackoverflow.com/questions/40435980/how-to-emulate-hyper-key-in-windows-10-using-autohotkey)).
```bash
#Requires AutoHotkey v2.0
; recommended for performance and compatibility with future autohotkey releases.
#UseHook
#SingleInstance force

InstallKeybdHook()

SendMode "Input"

;; deactivate capslock completely
SetCapslockState("AlwaysOff")

global CapslockIsDown := false

SetTimer(HandleCapslock, 50)

HandleCapslock() {
    global CapslockIsDown

    if (!CapslockIsDown && GetKeyState("Capslock", "P")) {
        CapslockIsDown := true
        Send("{Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}{LWin DownTemp}")
    } else if (CapslockIsDown && !GetKeyState("Capslock", "P")) {
        CapslockIsDown := false
        Send("{Ctrl Up}{Shift Up}{Alt Up}{LWin Up}")
        if (A_PriorKey == "Capslock") {
            Send("{Esc}")
        }
    }
}
```
Double click the script to run it.

To run this on startup, open the run dialog with Win + R, then type in `shell:startup` and place a shortcut to the script in this folder.
### Customization
- To switch to other hyper key variants, remove Shift or Win
- Change the tap behaviour by changing the Esc key
# References
- https://zenmushie.medium.com/how-to-get-your-very-own-hyper-key-0c91ed4a84ff
- https://github.com/Vonng/Capslock/blob/master/win/CapsLock.ahk
- https://github.com/pmb6tz/windows-desktop-switcher