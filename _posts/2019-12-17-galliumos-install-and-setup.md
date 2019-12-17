---
title: "Installing and seting-up GalliumOS from scratch"
categories: GalliumOS
tags: GalliumOS
excerpt: Notes on what I did to (re-)install GalliumOS on my Chromebook, and what additional steps I took to do the initial setting up.
date: 2019-12-17 21:10
#modified: 2019-03-04 20:35
---

Following an `apt upgrade` on GalliumOS which updated GRUB, and it would seem I [selected the wrong location to install the bootloader](https://www.reddit.com/r/GalliumOS/comments/6dxqy5/galliumos_wont_boot/), GalliumOS now won't boot up.  Unfortunately, [this guide for fixing the problem](https://www.reddit.com/r/GalliumOS/comments/5mhjd3/acer_14_wont_boot_after_grub_update/) didn't work for me, so I'm re-installing GalliumOS (again), and taking notes this time on what I do to get things the way I like it, just in case I need to do it all again sometime... :-)

-----

First up, install GalliumOS with chrx!  Following the [chrx install guide](https://chrx.org/#step-by-step) I did the following:
``` shell
crosh> shell
chronos@localhost / $ cd ; curl -Os https://chrx.org/go && sh go -H gallium -U dave -L en_GB.UTF-8 -Z Europe/London
```
Which installed GalliumOS, taking about 14mins.
(note: Installation log files are preserved in `/var/cache/chrx`)

