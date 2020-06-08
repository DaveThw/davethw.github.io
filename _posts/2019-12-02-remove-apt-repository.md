---
title: "How to Remove an apt Repository"
categories: Guides
tags: GalliumOS Linux apt
excerpt: Notes on how to remove a repository from apt's lists, on Linux
date: 2019-12-02 11:50
#last_modified_at: 2019-03-04 20:35
---

It seems that [AppGrid installs it's own repository](https://www.reddit.com/r/GalliumOS/comments/b8rwes/appgrip_repository_is_not_signed_on_galliumos/) (but not a GPG public key...), so running `sudo apt update` gives the following error (on GalliumOS):
``` shell
dave@chrx:~$ sudo apt update
[sudo] password for dave: 
Hit:1 http://apt.galliumos.org bismuth InRelease
Hit:2 http://archive.canonical.com/ubuntu bionic InRelease
Hit:3 http://security.ubuntu.com/ubuntu bionic-security InRelease
Hit:4 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:5 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:6 http://archive.ubuntu.com/ubuntu bionic-backports InRelease
Hit:8 http://ppa.launchpad.net/remmina-ppa-team/remmina-next/ubuntu bionic
 InRelease
Get:7 http://ppa.launchpad.net/appgrid/stable/ubuntu bionic InRelease [15.4 kB]
Err:7 http://ppa.launchpad.net/appgrid/stable/ubuntu bionic InRelease
  The following signatures couldn't be verified because the public key is not
   available: NO_PUBKEY 241FE6973B765FAE
Reading package lists... Done
W: GPG error: http://ppa.launchpad.net/appgrid/stable/ubuntu bionic InRelease:
 The following signatures couldn't be verified because the public key is not
 available: NO_PUBKEY 241FE6973B765FAE
E: The repository 'http://ppa.launchpad.net/appgrid/stable/ubuntu bionic
 InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore
 disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration
 details.
```

According to [this reply on Reddit](https://www.reddit.com/r/GalliumOS/comments/b8rwes/appgrip_repository_is_not_signed_on_galliumos/ek02k48/), "You can safely remove the ppa.launchpad.net entry from your APT config" - but it doesn't say how!

This is a single-line shell command which will list all of the current apt repositories, [found on askubuntu](https://askubuntu.com/a/741948):
``` shell
dave@chrx:~$ grep -r --include '*.list' '^deb ' /etc/apt/ | sed -re 's/^\/etc\/apt\/sources\.list((\.d\/)?|(:)?)//' -e 's/(.*\.list):/\[\1\] /' -e 's/deb http:\/\/ppa.launchpad.net\/(.*?)\/ubuntu .*/ppa:\1/'
deb http://archive.ubuntu.com/ubuntu/ bionic main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu bionic-security main restricted universe multiverse
deb http://archive.canonical.com/ubuntu bionic partner
[remmina-ppa-team-ubuntu-remmina-next-bionic.list] ppa:remmina-ppa-team/remmina-next
[appgrid-stable.list] ppa:appgrid/stable
[galliumos.list] deb http://apt.galliumos.org bismuth main
```

As for acutally removing the ppa, several of the [answers to the question on askubuntu](https://askubuntu.com/questions/307/how-can-ppas-be-removed) didn't work for me - specifically:
- `sudo ppa-purge -o appgrid` (and `sudo ppa-purge -o appgrid -p stable`) failed, complaining that `E: The repository 'http://ppa.launchpad.net/appgrid/stable/ubuntu bionic InRelease' is not signed.`
- `sudo add-apt-repository --remove ppa:appgrid/stable` looked like it might've worked, but `ppa:appgrid/stable` still appeared in the list of repositories given with the command above.

So in the end, I resorted to just deleting the relevant files from `/etc/apt/sources.list.d/`:
``` shell
dave@chrx:~$ ls /etc/apt/sources.list.d
appgrid-stable.list                     galliumos.list
appgrid-stable.list.save                galliumos.list.save
appgrid-ubuntu-stable-bionic.list       remmina-ppa-team-ubuntu-remmina-next-bionic.list
appgrid-ubuntu-stable-bionic.list.save  remmina-ppa-team-ubuntu-remmina-next-bionic.list.save
dave@chrx:~$ sudo rm -i /etc/apt/sources.list.d/appgrid*
rm: remove regular file '/etc/apt/sources.list.d/appgrid-stable.list'? y
rm: remove regular file '/etc/apt/sources.list.d/appgrid-stable.list.save'? y
rm: remove regular empty file '/etc/apt/sources.list.d/appgrid-ubuntu-stable-bionic.list'? y
rm: remove regular empty file '/etc/apt/sources.list.d/appgrid-ubuntu-stable-bionic.list.save'? y
dave@chrx:~$ grep -r --include '*.list' '^deb ' /etc/apt/ | sed -re 's/^\/etc\/apt\/sources\.list((\.d\/)?|(:)?)//' -e 's/(.*\.list):/\[\1\] /' -e 's/deb http:\/\/ppa.launchpad.net\/(.*?)\/ubuntu .*/ppa:\1/'
deb http://archive.ubuntu.com/ubuntu/ bionic main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu bionic-security main restricted universe multiverse
deb http://archive.canonical.com/ubuntu bionic partner
[remmina-ppa-team-ubuntu-remmina-next-bionic.list] ppa:remmina-ppa-team/remmina-next
[galliumos.list] deb http://apt.galliumos.org bismuth main
dave@chrx:~$ sudo apt update
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:3 http://archive.ubuntu.com/ubuntu bionic-backports InRelease
Hit:4 http://apt.galliumos.org bismuth InRelease
Hit:5 http://ppa.launchpad.net/remmina-ppa-team/remmina-next/ubuntu bionic InRelease
Hit:6 http://security.ubuntu.com/ubuntu bionic-security InRelease
Hit:7 http://archive.canonical.com/ubuntu bionic InRelease
Reading package lists... Done
Building dependency tree
Reading state information... Done
44 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

Which seems to have worked, so far!.. 
