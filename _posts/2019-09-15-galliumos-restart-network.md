---
title: "Restarting Networking on GalliumOS"
categories: GalliumOS
tags: Network GalliumOS
excerpt: Notes on how to restart networking on GalliumOS
date: 2019-09-15 22:00
#last_modified_at: 2019-03-04 20:35
---

Sometimes after waking from sleep, networking seems to fail on GalliumOS on my laptop.

Check status of `network-manager` with:
``` shell
~ $ service network-manager status
```

If at the top it says `failed` in red (or, basically anything other than `active (running)` in green!) then `network-manager` needs restarting.  This should do the trick:
``` shell
~ $ sudo service network-manager restart
```

However, restarting `network-manager` seems to (sometimes?) crash the networking applet that sits in the Notification Area.  ([See bug report](https://bugs.launchpad.net/ubuntu/+source/network-manager-applet/+bug/1404324))  If so, the network status icon will disappear from the Notificaiton Area.  `nm-applet` can be restarted as follows:
``` shell
~ $ killall nm-applet; nm-applet & disown
```
(based on comment #5 on the bug report above, and [other ideas from SuperUser.com](https://superuser.com/a/513503))
