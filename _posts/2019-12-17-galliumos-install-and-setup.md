---
title: "How to install and set-up GalliumOS from scratch"
categories: GalliumOS
tags: GalliumOS
excerpt: Notes on what I did to (re-)install GalliumOS on my Chromebook, and what additional steps I took to do the initial setting up.
date: 2019-12-17 21:10
#modified: 2019-03-04 20:35
---

First up, install GalliumOS with chrx!  Following the [chrx install guide](https://chrx.org/#step-by-step) I did the following:
``` shell
crosh> shell
chronos@localhost / $ cd ; curl -Os https://chrx.org/go && sh go -H gallium -U dave -L en_GB.UTF-8 -Z Europe/London
```
Which installed GalliumOS, taking about 14mins.
(note: Installation log files are preserved in `/var/cache/chrx`)

