---
title: "Installing OLA on a Raspberry Pi"
categories: RaspberryPi
tags: RaspberryPi OLA DMX
excerpt: Notes on how to install and set-up OLA (Open Lighting Architecture) on a Raspberry Pi.
date: 2020-01-04 15:30
# modified: 2019-12-29 16:00
---

OLA is a software framework for interfacing with various DMX protocols - see [openlighting.org/ola](https://www.openlighting.org/ola/).  The website/wiki seems to be a bit out of date, but [the github repository](https://github.com/OpenLightingProject/ola) is still getting (occasional?) updates.

The tutorial for [getting started on a Raspberry Pi](https://www.openlighting.org/ola/tutorials/ola-on-raspberry-pi/) suggests using their pre-built Raspbian images, but they are (at least) 5 years old - plus I want to install it on an existing Raspberry Pi.  The general [Linux Install guide](https://www.openlighting.org/ola/linuxinstall/) seems to imply that you're likely to have to build OLA from the source code - there's a link to some notes on [installing a pre-packaged version for Debian / Ubuntu](http://opendmx.net/index.php/OLA_Debian_/_Ubuntu), but the repositories for Raspbian seem to be 4 or 5 years old.

However, after all of that, it seems that OLA is available via the standard raspbian repository (v.0.10.7 as of Jan 2020)!..  So installation is easy:
``` shell
~ $ sudo apt update
~ $ sudo apt install ola
```
*(takes about a minute!)*  
This installs the software, creates a user called `olad` (added to the `dialout` and `plugdev` groups), and sets up (and starts) OLAd as an `init.d` service.

So, the current status of OLAd can be checked with:
``` shell
~ $ service olad status
```

The init.d script (`/etc/init.d/olad`) runs the daemon as the user `olad`, and with `/etc/ola` as the config dir.

By default, the Paspberry Pi has its SPI interface disabled, so enable it in Menu -> Preferences -> Raspberry Pi Configuration -> Interfaces (reboot not necessary?).  Also, the `olad` user doesn't have access to the SPI interface, so [give permission](https://www.raspberrypi.org/forums/viewtopic.php?t=106814#p736114) with:
``` shell
~ $ grep spi: /etc/group
spi:x:999:pi
~ $ sudo adduser olad spi
Adding user `olad' to group `spi' ...
Adding user olad to group spi
Done.
~ $ grep spi: /etc/group
spi:x:999:pi,olad
```
Then restart the daemon:
``` shell
~ $ sudo service olad restart
```

To make life easier, [give yourself permission to edit the config files](http://opendmx.net/index.php/OLA_Debian_/_Ubuntu#Configuration) (they are all owned by `olad`):
``` shell
~ $ sudo adduser pi olad
```
(you'll probably need to log out and back in again for this to take effect)

The StageProfi plugin seems to try to lock `/dev/ttyUSB0` every 5 seconds, which generates a lot of log entries - disable the plugin by editing `/etc/ola/ola-stageprofi.conf` - change the second line to `enabled = false` then restart olad:
``` shell
~ $ sudo service olad restart
```

At this point you should be able to access the OLA Admin page at (something like) http://192.168.1.75:9090/
