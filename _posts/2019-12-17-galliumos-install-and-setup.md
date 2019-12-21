---
title: "Installing and seting-up GalliumOS from scratch"
categories: GalliumOS
tags: GalliumOS
excerpt: Notes on what I did to (re-)install GalliumOS on my Chromebook, and what additional steps I took to do the initial setting up.
date: 2019-12-17 21:10
# modified: 2019-12-20 22:00
# modified: 2019-12-21 15:10
# modified: 2019-12-21 17:30
modified: 2019-12-21 21:00
---

Following an `apt upgrade` on GalliumOS which updated GRUB, and it would seem I [selected the wrong location to install the bootloader](https://www.reddit.com/r/GalliumOS/comments/6dxqy5/galliumos_wont_boot/), GalliumOS now won't boot up.  Unfortunately, [this guide for fixing the problem](https://www.reddit.com/r/GalliumOS/comments/5mhjd3/acer_14_wont_boot_after_grub_update/) didn't work for me, so I'm re-installing GalliumOS (again), and taking notes this time on what I do to get things the way I like it, just in case I need to do it all again sometime... :-)

-----

First up, install GalliumOS with chrx!  Following the [chrx install guide](https://chrx.org/#step-by-step) I did the following:
``` shell
crosh> shell
chronos@localhost / $ cd ; curl -Os https://chrx.org/go && sh go -H gallium -U dave -L en_GB.UTF-8 -Z Europe/London
```
Which installed GalliumOS, taking about 14mins.  (note: Installation log files are preserved in `/var/cache/chrx`)

-----

Once logged in to GalliumOS, update keyboard settings:
 - Menu -> Settings -> Settings Manager -> Keyboard -> Layout
 - Set "Keyboard model" to "Chromebook Falco/Pixel/Pixel2 / Search overlay / F keys mapped to media keys"  ([see here for more details](https://wiki.galliumos.org/Media_keys_and_default_keybindings) - Right alt as overlay doesn't work with some programmes (eg. Chromium takes the Right-Alt press as a start to keyboard navigation of the browser toolbar...))
 - Also add "English (UK)" to "Keyboard layout", and remove "English (US)"
Note: On the initial login screen, the Keyboard layout will (always?) be "English (US)" - therefore be wary of special characters / punctuation like `"£@#~\|¬` in passwords...

-----

Don't forget to change the default password - use `passwd` in a terminal window.

-----

Change Window Manager theme, mainly to give thicker borders on windows:
 - Menu -> Settings -> Settings Manager -> Window Manager -> Style
 - Set "Theme" to "Daloa" or "Kokodi" - some of the others have thick borders too.
 - More details [here](https://mxlinux.org/wiki/xfce/changing-border-size-with-xfce4-window-manager/) and [here](https://sevkeifert.blogspot.com/2014/12/increase-window-border-size-in-xubuntu.html)


Generally tweak various settings:
 - File Manager settings:
   * On the Display tab:
     + Set "Date" format to "Today at 20:21:11"
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

-----

Set up user's bin:
 - make new directory `~/bin`
 - copy `timer.sh` from Moneta into `bin`
   * rename to `timer`
   * make executable with `chmod a+x ~/bin/timer`
 - I think you'll then need to log out and in again to see `/home/dave/bin` appear in `$PATH`...

-----

Check the current timezone settings:
``` shell
dave@gallium:~$ timedatectl
                      Local time: Fri 2019-12-20 22:13:47 UTC
                  Universal time: Fri 2019-12-20 22:13:47 UTC
                        RTC time: Fri 2019-12-20 22:13:47
                       Time zone: Etc/UTC (UTC, +0000)
       System clock synchronized: yes
systemd-timesyncd.service active: yes
                 RTC in local TZ: no
dave@gallium:~$ cat /etc/timezone 
Etc/UTC
dave@gallium:~$ ls -l /etc/localtime 
lrwxrwxrwx 1 root root 27 Dec 17 16:41 /etc/localtime -> /usr/share/zoneinfo/Etc/UTC
```

[Set timezone](https://www.tecmint.com/set-time-timezone-and-synchronize-time-using-timedatectl-command/) to Europe/London:
``` shell
dave@gallium:~$ timedatectl set-timezone "Europe/London"
```

Check the new settings:
``` shell
dave@gallium:~$ timedatectl
                      Local time: Fri 2019-12-20 22:16:48 GMT
                  Universal time: Fri 2019-12-20 22:16:48 UTC
                        RTC time: Fri 2019-12-20 22:16:48
                       Time zone: Europe/London (GMT, +0000)
       System clock synchronized: yes
systemd-timesyncd.service active: yes
                 RTC in local TZ: no
dave@gallium:~$ cat /etc/timezone 
Europe/London
dave@gallium:~$ ls -l /etc/localtime 
lrwxrwxrwx 1 root root 35 Dec 20 22:16 /etc/localtime -> ../usr/share/zoneinfo/Europe/London
```

-----

[Remove the AppGrid ppa repository](https://dave.thwaites.org.uk/galliumos/remove-apt-repository.html):
``` shell
dave@gallium:~$ sudo rm -i /etc/apt/sources.list.d/appgrid*
dave@gallium:~$ sudo apt update
```

I've also removed AppGrid, as I don't use it, and I hope this might prevent the repository from reappearing...
``` shell
dave@gallium:~$ sudo apt remove appgrid
dave@gallium:~$ sudo apt autoremove
```

-----

Install additional software:
 - [Libre Office](https://www.libreoffice.org/): main Gallium/Ubuntu repositories only have an older version available (v.6.0.7, as of time of writing) - a more up-to-date version (v.6.3.4) can be found at [ppa:libreoffice/ppa](https://launchpad.net/~libreoffice/+archive/ubuntu/ppa)
   * Add the repository:
     ``` shell
     dave@gallium:~$ sudo add-apt-repository ppa:libreoffice/ppa
     ```
   * Install:
     ``` shell
     dave@gallium:~$ sudo apt install libreoffice
     ```
     *(took a couple of minutes)*
 - [RealVNC Viewer](https://www.realvnc.com/en/): doesn't seem to be available via apt repositories, so download and install from the website:
   * Download the Linux / DEB x64 version of the viewer from [the RealVNC website](https://www.realvnc.com/en/connect/download/viewer/)
   * Open the Downloads folder, right-click on the VNC-Viewer .deb file, and choose "Open With "GDebi Package Installer""
   * Click on "Install Package"
   * If that doesn't seem to work, [try in a terminal instead](https://www.addictivetips.com/ubuntu-linux-tips/realvnc-on-linux/):
     ``` shell
     dave@gallium:~$ cd ~/Downloads
     dave@gallium:~/Downloads$ sudo dpkg -i VNC-Viewer-*-Linux-x64.deb
     dave@gallium:~/Downloads$ sudo apt install -f
     ```
     (the last line [attempts to fix any broken dependancies](https://askubuntu.com/a/1039353))
 - [Remmina](https://remmina.org/):
   * Following the [official instructions for Ubuntu](https://remmina.org/how-to-install-remmina/#ubuntu):
     ``` shell
     dave@gallium:~$ sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
     dave@gallium:~$ sudo apt update
     dave@gallium:~$ sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
     ```
     *(install took about 40s)*  
     (I'm not sure how essential the `sudo apt update` is - it looks like `apt-add-repository` does it too)
