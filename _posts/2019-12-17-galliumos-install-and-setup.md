---
title: "Installing and seting-up GalliumOS from scratch"
categories: GalliumOS
tags: GalliumOS
excerpt: Notes on what I did to (re-)install GalliumOS on my Chromebook, and what additional steps I took to do the initial setting up.
date: 2019-12-17 21:10
# modified: 2019-12-20 22:00
# modified: 2019-12-21 15:10
# modified: 2019-12-21 17:30
# modified: 2019-12-21 21:00
# modified: 2019-12-22 21:00
modified: 2019-12-23 18:00
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

Add the option to [change the keybaord layout on the initial login screen](https://www.reddit.com/r/GalliumOS/comments/9awzdu/keyboard_layout_on_login_screen/):
 - `dave@gallium:~$ sudo mousepad  /etc/lxdm/lxdm.conf`
 - Scroll down to the `[display]` section
 - set `bottom_pane=1` and `keyboard=1`

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
(or you can do it graphically - see below)

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

Adjust the clock display settings:
 - Right-click on the clock, then choose Properites
 - Change Clock Options - Format to Custom Format
 - [Set the format](https://docs.xfce.org/xfce/xfce4-panel/4.12/clock#label_and_tooltip_markup) to `%-l:%M:%S %P` (or whatever...)

If you haven't set the timezone yet, you can do it by clicking on "Time and Date Settings..." (or Menu->Settings->Time and Date):
 - Click "Unlock"
 - Click on the Time zone at the top
 - Click on London in the map, or pick "Europe/London" from the drop-down menu

Note: The Time and Date Settings window shows Configuration as Manual, and if you try to change it to "Keep synchronised with Internet servers" it complains that "NTP support is not installed".  However timedatectl reports that `systemd-timesyncd.service active: yes`... Not sure what's going on there...

-----

Install NTPd:
As mentioned above, the Time and Date Settings window seems to think that the time configuation is manual, even with `timedatectl set-ntp on`.  This seems to be similar to [the issue here](https://www.reddit.com/r/GalliumOS/comments/cx9b2n/time_server_ntp_support_is_not_installed/), although it's maybe not described very well...  Following the suggestion(s) there don't seem to help (ie. time **is** synchronised by systemd-timesyncd, but the Time and Date Settings window doesn't know it...).

[Installing NTPd](https://vitux.com/how-to-install-ntp-server-and-client-on-ubuntu/) (and turning off `timedatectl set-ntp`) seems to make Time and Date Settings happier!:
 - Install the NTP daemon:
   ``` shell
   dave@gallium:~$ sudo apt update
   dave@gallium:~$ sudo apt install ntp
   ```
 - Confirm it's installed:
   ``` shell
   dave@gallium:~$ sntp --version
   sntp 4.2.8p10@1.3728-o (1)
   ```
 - Update the config file:
   ``` shell
   dave@gallium:~$ sudo mousepad /etc/ntp.conf
   ```
   - Look for the details for nearest NTP Server pool here: https://support.ntp.org/bin/view/Servers/NTPPoolServers.
   - Fill out the details in the `ntp.conf` file - note, the support.ntp.org website suggests that the config file lines should be something like `server 0.uk.pool.ntp.org`, but the version of ntp I have installed [seems to use](https://www.freebsd.org/cgi/man.cgi?query=ntp.conf&sektion=5&manpath=freebsd-release-ports) `pool 0.uk.pool.ntp.org iburst`.
   - Save `ntp.conf` when you're done!
 - Re-start the NTP server:
   ``` shell
   dave@gallium:~$ sudo service ntp restart
   ```
 - And check that it's running, if you want:
   ``` shell
   dave@gallium:~$ sudo service ntp status
   ```
 - Turn off the systemd-timesyncd service:
   ``` shell
   dave@gallium:~$ sudo timedatectl set-ntp off
   ```
 - Check if the local clock is synchronized with an NTP server:
   ``` shell
   dave@gallium:~$ ntpdate -qu 0.uk.pool.ntp.org
   ```
 - View the Time Synchronization Queue:
   ``` shell
   dave@gallium:~$ ntpq -p
   ```

Now the Time and Date Settings window should show the Configuration as "Keep synchronised with Internet servers"! :-)

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
   * Open up VNC Viewer (in Menu->Internet) - sign in (needs Authy for an authentication code)
 - [Remmina](https://remmina.org/):
   * Following the [official instructions for Ubuntu](https://remmina.org/how-to-install-remmina/#ubuntu):
     ``` shell
     dave@gallium:~$ sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
     dave@gallium:~$ sudo apt update
     dave@gallium:~$ sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
     ```
     *(install took about 40s)*  
     (I'm not sure how essential the `sudo apt update` is - it looks like `apt-add-repository` does it too)
 - [LXFree for Java](https://www.claudeheintzdesign.com/lx/lxfree_about.html):
   * Download the Linux 64bit dpkg from [the downloads page](https://www.claudeheintzdesign.com/lx/lxfreejava_download.html)
   * Then, in a terminal:
     ``` shell
     dave@gallium:~$ cd ~/Downloads
     dave@gallium:~/Downloads$ sudo dpkg -i lxfreeforjava_x64.deb
     dave@gallium:~/Downloads$ sudo apt install -f
     ```
     (LXFree for Java appears in the Menu->Other)

-----

Change Favourites in the application menu - something like this:
 - GalliumOS Update *(System)*
 - Synaptic Package Manager *(System)*
 - Settings Mamanger *(Settings)*
 - Task Manager *(System)*
 - Chromium Web Browser *(Internet)*
 - Mousepad *(Accessories)*
 - VNC Viewer *(Internet)*
 - Remmina *(Internet)*
 - Calculator *(Accessories)*
 - LXFree for Java *(Other)*
 - LibreOffice *(Office)*
