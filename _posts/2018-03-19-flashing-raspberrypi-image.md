---
# layout: post
title: "Flashing an OS image for Raspberry Pi"
categories: Guides
tags: Linux RaspberryPi ChromeOS EOS-Remote
excerpt: Step-by-step notes on how to flash a (fresh!) OS image for a Raspberry Pi, on an (old) SD card, using (my) Chromebook
redirect_from: /theatre-royal/eos-remote/Flashing-RaspberryPi-Image.html
---

First, download an OS image from https://www.raspberrypi.org/downloads/ - I've been using Raspbian (March 2018 version, released on 2018-03-13).

Then we need to flash the image onto an SD card.  This isn't directly possible on a Chromebook (as far as I'm aware), but is possible using [Etcher](https://etcher.io/) under Crouton!

Before starting Crouton, it's worth inserting the SD card into your Chromebook, and then ejecting any removable drives that appear in the ChromeOS File app (I struggled a bit when I did this later in the process!) - there may be several if it's an SD card that you've previously used on a Raspberry Pi.  And obviously this process will wipe anything that's currently on the SD card, so backup anything that you want to keep!..

So, (install and) start up Crouton:
`Ctrl-Alt-T` to open a new terminal on ChromeOS, then:
```shell
crosh> shell
```
If you haven't updated the Crouton chroot for a while, might be worth doing so:
```shell
chronos@localhost / $ sudo sh ~/Downloads/crouton -u -n xenial
```
(Replace `xenial` with whatever your chroot is called - use `sudo edit-chroot -a` to list all installed chroot names - see the [Crouton Command Cheet Sheet](https://github.com/dnschneid/crouton/wiki/Crouton-Command-Cheat-Sheet) for other useful commands!)  Then start up your chroot:
```shell
chronos@localhost / $ sudo startxfce4
```
(Or whatever is the appropriate `start????` command for your Crouton install)

I didn't have much success with the AppImage download from the [Etcher website](https://etcher.io/), so went for the [Package Repository method](https://github.com/resin-io/etcher#installers) described on [their GitHub page](https://github.com/resin-io/etcher) instead.  So, within the Crouton chroot, open a terminal window, then:
```shell
(xenial)dave@localhost:~$ echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee /etc/apt/sources.list.d/etcher.list
(xenial)dave@localhost:~$ sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 379CE192D401AB61
(xenial)dave@localhost:~$ sudo apt-get update
(xenial)dave@localhost:~$ sudo apt-get install etcher-electron
```

Once installed, you should be able to find Etcher in the Applications menu, probably under Accessories.  However, running it from there runs into an issue when you try to actually flash the image to an SD card - an error box pops up saying "No polkit authentication agent found".  I didn't try to install a polkit authentication agent, instead I ran Etcher with sudo (might be bad practice..?):
```shell
(xenial)dave@localhost:~$ sudo etcher-electron
```

Then in Etcher select the OS image file (you should be able to select it directly from the Downloads folder (which is shared with ChromeOS) - no need to unzip it! :-), check that Etcher has selected the correct SD card (probably only one listed - double check it's the right size!), then click on "Flash!"  Flashing the 2018-03-13 release of Raspbian onto a SanDisk 8GB Class 4 SDHC card took about 17mins, plus another 6 mins for Etcher to verify the image - don't swap from the chroot back into ChromeOS during the process as it may throw up an error when you return to the chroot!

Once it's finished flashing the SD card, Etcher will unmount it.  Logout of your chroot, and try to eject any removable drives that have appeared in ChromeOS (didn't work for me - ChromeOS claimed they were still in use...), remove your SD card, and you're good to go!
