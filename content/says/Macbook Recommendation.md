---
title: Macbook Recommendation
date: 2024-11-26
draft: false
---

Interested in picking up a Macbook to replace your developer laptop? Here's a list of pros and cons. Note that I'm coming from years of Windows (+ WSL) and don't have much experience daily driving Linux on my laptop.

I'm currently using a MBA M2 16G/512G, comparing the experience against my glacially slow (and hot), IT scanning app infested i7-1185G7 HP company laptop.
# Pros
## Hardware
- Efficiency and battery life is amazing
	- The new Ryzen AI and Lunar Lake chips are taking big strides in energy efficiency, but
		- Can you trust them to sleep properly? Windows sleep has been broken since forever
		- Still generations behind Apple on efficiency at lower power
	- During normal use, my _entire_ MBA, including the screen, idles at 4-5W!
	- I've set my MBA to use its efficiency cores only on battery, and it still feels snappier than Windows running full tilt
	- Hardware acceleration (for the NPU and media engine) is top-notch
- You can charge Macbooks off anything, even a 5V 2A power supply, in a pinch!
- One of the brightest screens at 500 nits (the new MBP has 1000 nits and a matte option)
- Subjectively, the best keyboard. I've tried dozens of laptops and other manufacturers and don't like any of them. The closest experience is probably Microsoft's Surface line
- The best trackpad, period
## Software
- If you need x86 support, you have lots of options for translation/emulation: quickemu, UTM, orbstack, Parallels
## OS
- Things just feel really snappy on average, nothing really crashes⁠
- Most OS quirks can be solved with third party apps, or ⁠ `defaults`⁠ to set system/app preferences.
- There's a lot of very well polished third party apps to improve your productivity available, compared to Windows
	- BetterTouchTool, Karabiner Elements, ShortCat, AlDente, etc
# Cons
## Anti-consumer
- Anti right to repair
- If something breaks, you're shit out of luck if you're out of the [1 year warranty period or 3 year AppleCare+ protection](https://www.apple.com/my/support/products/mac/#:~:text=Every%20Mac%20comes%20with%20a,days%20of%20complimentary%20technical%20support.). Repairs are so expensive that in a lot of cases you might as well upgrade to the latest Macbook
- You can't upgrade your memory or storage, so you're stuck with Apple's outrageously exorbitant upgrade pricing
- Can't replace the storage yourself if your SSD dies
- Apart from the base model, anything else is prohibitively expensive
- Apple has some (deliberate?) design flaws (like display connectors, display angle sensors) that fail quickly and prompt expensive repairs
## OS
These OS quirks can't be solved with third party apps, or it's just me complaining
- External display support is quite bad. As there's no fractional display scaling, you _have_ to go with 1080p or 4k monitors. 1440p will look blurry and horrible no matter what you do
- Fullscreen behaviour is annoying (creates a completely new space)
- exFAT support is terrible
	- File copy behaviour is erratic
	- Drives may completely lock up and refuse to work
- Also, I don't like Finder
	- No cut and paste (you can Cmd + C and Opt + Cmd + V instead to move, but it's so clunky to execute)
	- Can't drag files without window focus. If you have 2 Finder windows open side by side, you can't just click and drag files immediately from the unfocused Finder, you have to waste another click to focus it before it lets you do it
- Rename file is Return instead of F2, Cmd + O is open instead
## Remote access to Linux
- ⁠I haven't been able to get X11 forwarding to work with XQuartz or Xpra.
- ⁠SPICE doesn't seem to be supported as well
- I keep wishing I had something like Microsoft's WSL and Windows Terminal integration
# Conclusion
Daily driving a Macbook just feels like a _nice_, well polished experience, if you have deep pockets and can overlook the really frustrating fullscreen behaviour or exFAT problems.

It's not good value, but not everything in life has to be.