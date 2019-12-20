---
title: "Installing and seting-up GalliumOS from scratch"
categories: GalliumOS
tags: GalliumOS
excerpt: Notes on what I did to (re-)install GalliumOS on my Chromebook, and what additional steps I took to do the initial setting up.
date: 2019-12-17 21:10
modified: 2019-12-20 22:00
---

Following an `apt upgrade` on GalliumOS which updated GRUB, and it would seem I [selected the wrong location to install the bootloader](https://www.reddit.com/r/GalliumOS/comments/6dxqy5/galliumos_wont_boot/), GalliumOS now won't boot up.  Unfortunately, [this guide for fixing the problem](https://www.reddit.com/r/GalliumOS/comments/5mhjd3/acer_14_wont_boot_after_grub_update/) didn't work for me, so I'm re-installing GalliumOS (again), and taking notes this time on what I do to get things the way I like it, just in case I need to do it all again sometime... :-)

-----

First up, install GalliumOS with chrx!  Following the [chrx install guide](https://chrx.org/#step-by-step) I did the following:
``` shell
crosh> shell
chronos@localhost / $ cd ; curl -Os https://chrx.org/go && sh go -H gallium -U dave -L en_GB.UTF-8 -Z Europe/London
```
Which installed GalliumOS, taking about 14mins.  (note: Installation log files are preserved in `/var/cache/chrx`)


Once logged in to GalliumOS, update keyboard settings:
 - Menu -> Settings -> Settings Manager -> Keyboard -> Layout
 - Set "Keyboard model" to "Chromebook Falco/Pixel/Pixel2 | Search overlay | F keys mapped to media keys"  ([see here for more details](https://wiki.galliumos.org/Media_keys_and_default_keybindings) - Right alt as overlay doesn't work with some programmes (eg. Chromium takes the Right-Alt press as a start to keyboard navigation of the browser toolbar...))
 - Also add "English (UK)" to "Keyboard layout", and remove "English (US)"
Note: On the initial login screen, the Keyboard layout will (always?) be "English (US)" - therefore be wary of special characters / punctuation like `"£@#~\|¬` in passwords...


Change Window Manager theme, mainly to give thicker borders on windows:
 - Menu -> Settings -> Settings Manager -> Window Manager -> Style
 - Set "Theme" to "Daloa" or "Kokodi" - some of the others have thick borders too.
 - More details [here](https://mxlinux.org/wiki/xfce/changing-border-size-with-xfce4-window-manager/) and [here](https://sevkeifert.blogspot.com/2014/12/increase-window-border-size-in-xubuntu.html)


Generally tweak various settings:
 - File Manager settings:
   * On the Display tab:
     + Set "Date" format to "Today - at 20:21:11"
 - Screen Saver settings:
   * install missing screensaver modules with `sudo apt install xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra`
 - Window Manager settings:
   * On the Keyboard tab:
     + set "Toggle Fullscreen" to F4 (the fullscreen button!)
     + set "Tile window to the left" to Ctrl-Alt-[
     + set "Tile window to the right" to Ctrl-Alt-]
   * On the Focus tab:
     + turn on "Automatically raise windows when they receive focus"
   * On the Advanced tab:
     + turn on "Window snapping - to other windows"


Set up user's bin:
 - make new directory `~/bin`
 - copy `timer.sh` from Moneta into `bin`
   * rename to `timer`
   * make executable with `chmod a+x ~/bin/timer`
 - I think you'll then need to log out and in again to see `/home/dave/bin` appear in `$PATH`
