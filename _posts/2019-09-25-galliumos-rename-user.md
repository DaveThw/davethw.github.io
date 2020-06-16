---
title: "Rename a User on Linux / GalliumOS"
categories: Guides
tags: GalliumOS Linux
excerpt: Notes on how to rename a user on Linux (specifically on GalliumOS)
date: 2019-09-25 20:30
#last_modified_at: 2019-03-04 20:35
redirect_from: /galliumos/galliumos-rename-user.html
---

It seems renaming a user on Linux isn't quite a trivial affair!  So, following guides found [on Reddit](https://www.reddit.com/r/GalliumOS/comments/4ffzwh/chrx_username_change_not_working/), and [on nixCraft](https://www.cyberciti.biz/faq/howto-change-rename-user-name-id/) the following seemed to work for me.

-----

TL;DR: Here are the commands you need (to rename the user `chrx` to `dave`):
``` shell
~ $ sudo adduser tmpuser
~ $ sudo usermod -a -G sudo tmpuser
```
Log-out from the original user, then log in as tmpuser
``` shell
~ $ ps -u chrx
~ $ sudo pkill -u chrx
~ $ sudo pkill -9 -u chrx
~ $ ps -u chrx
~ $ sudo usermod -l dave chrx
~ $ sudo groupmod -n dave chrx
~ $ sudo usermod -d /home/dave -m dave
~ $ sudo passwd dave
```
Log-out from tmpuser, then log in as the new user
``` shell
~ $ sudo deluser --remove-home tmpuser
```

-----

First, create a new, temporary user, and give them sudo powers:
``` shell
~ $ sudo adduser tmpuser
[sudo] password for chrx: 
Adding user `tmpuser' ...
Adding new group `tmpuser' (1001) ...
Adding new user `tmpuser' (1001) with group `tmpuser' ...
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
Changing the user information for tmpuser
Enter the new value, or press ENTER for the default
	Full Name []: 
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
~ $ sudo usermod -a -G sudo tmpuser
```


Then log-out from the original user, and log in as the temporary user `tmpuser`.  First up, it's probably worth checking the set-up for the original user (`chrx`):
``` shell
~ $ id chrx
uid=1000(chrx) gid=1000(chrx) groups=1000(chrx),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lpadmin)
~ $ grep '^chrx:' /etc/passwd
chrx:x:1000:1000::/home/chrx:/bin/bash
~ $ grep 'chrx' /etc/group
adm:x:4:syslog,chrx
cdrom:x:24:chrx
sudo:x:27:chrx,tmpuser
dip:x:30:chrx
plugdev:x:46:chrx
lpadmin:x:116:chrx
chrx:x:1000:
~ $ groups chrx
chrx : chrx adm cdrom sudo dip plugdev lpadmin
~ $ ls -ld /home/chrx
drwxr-xr-x 16 chrx chrx 4096 Sep 24 18:43 /home/chrx
```


Confirm that the original user `chrx` doesn't have any running processes:
``` shell
~ $ ps aux | grep chrx
tmpuser   1411  0.0  0.0  23564  1080 pts/0    S+   18:46   0:00 grep --color=auto chrx
~ $ ps -u chrx
  PID TTY          TIME CMD
```
If there are some, stop them with:
``` shell
~ $ sudo pkill -u chrx
~ $ sudo pkill -9 -u chrx
~ $ ps -u chrx
  PID TTY          TIME CMD
```


Use `usermod` to rename the user `chrx` to `dave`:
``` shell
~ $ sudo usermod -l dave chrx
[sudo] password for tmpuser: 
```


If you want to check that that's worked:
``` shell
~ $ id chrx
id: ‘chrx’: no such user
~ $ id dave
uid=1000(dave) gid=1000(chrx) groups=1000(chrx),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lpadmin)
~ $ ls -ld /home/chrx
drwxr-xr-x 16 dave chrx 4096 Sep 24 18:43 /home/chrx
```


Next, use `groupmod` to rename the group `chrx` to `dave`:
``` shell
~ $ sudo groupmod -n dave chrx
~ $ id dave
uid=1000(dave) gid=1000(dave) groups=1000(dave),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lpadmin)
~ $ ls -ld /home/chrx
drwxr-xr-x 16 dave dave 4096 Sep 24 18:43 /home/chrx
```


Next, use `usermod` to move `dave`'s home directory (from `/home/chrx`) to `/home/dave`:
``` shell
~ $ grep '^dave:' /etc/passwd
dave:x:1000:1000::/home/chrx:/bin/bash
~ $ sudo usermod -d /home/dave -m dave
~ $ grep '^dave:' /etc/passwd
dave:x:1000:1000::/home/dave:/bin/bash
```


Check that everything looks good:
``` shell
~ $ grep 'dave' /etc/group
adm:x:4:syslog,dave
cdrom:x:24:dave
sudo:x:27:tmpuser,dave
dip:x:30:dave
plugdev:x:46:dave
lpadmin:x:116:dave
dave:x:1000:
~ $ grep 'chrx' /etc/group
~ $ groups chrx
groups: ‘chrx’: no such user
~ $ groups dave
dave : dave adm cdrom sudo dip plugdev lpadmin
~ $ ls -ld /home/chrx
ls: cannot access '/home/chrx': No such file or directory
~ $ ls -ld /home/dave
drwxr-xr-x 16 dave dave 4096 Sep 24 18:43 /home/dave
```


Finally, if necessary, change the password for `dave`:
``` shell
~ $ sudo passwd dave
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
~ $ 
```


Then you can log out from `tmpuser`, and log in as `dave`!  Once you are happy that everything has worked, you can delete `tmpuser`:
``` shell
~ $ sudo deluser --remove-home tmpuser
Looking for files to backup/remove ...
Removing files ...
Removing user `tmpuser' ...
Warning: group `tmpuser' has no more members.
Done.
```

-----

When logging in as the new user for the first time on GalliumOS, I got a pop-up message saying that the `Configured directory for incoming files does not exist`.  This seems to have been covered [on AskUbuntu](https://askubuntu.com/questions/837977/configured-directory-for-incoming-file-does-not-exist), solving the problem either [with a GUI window](https://askubuntu.com/a/874145) or [in a terminal window](https://askubuntu.com/a/901111).
