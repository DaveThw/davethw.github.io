---
# layout: post
title:  "Network Metrics (on a Raspberry Pi)"
categories: Guides
tags: Linux RaspberryPi Network EOS-Remote
excerpt: Step-by-step notes on how to adjust the network metrics when working multiple ports
redirect_from: /theatre-royal/eos-remote/network-metrics.html
---
So... With my Raspberry Pi now connected to two networks - one with the LAN port, on a closed network, and one via a wifi dongle, with internet access, both with gateways configured (because I can't work out how to tell the router on the closed network that it doesn't actually have internet access!..) - the Raspberry Pi prefers to use the LAN port for internet access.  But, of course, this doesn't work.

```shell
~$ route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         10.101.1.1      0.0.0.0         UG    202    0        0 eth0
default         www.routerlogin 0.0.0.0         UG    303    0        0 wlan0
10.101.0.0      *               255.255.0.0     U     202    0        0 eth0
192.168.1.0     *               255.255.255.0   U     303    0        0 wlan0
```

Note: the Metric value for the gateway entry for eth0 is lower than that for the gateway entry for wlan0.

Based on [this answer on raspberrypi.stackexchange](http://raspberrypi.stackexchange.com/questions/40228/make-permanent-change-in-the-routing-table#answer-50951), I just needed to add a couple of lines to the end of `/etc/dhcpcd.conf`:
```
# Give eth0 a higher metric than wlan0 (default metric: 303)
interface eth0
metric 402
```
Note: in the answer on stackexchange, each line is terminated with a `;` - this doesn't seem to be necessary, looking at the rest of `/etc/dhcpcd.conf` - and indeed seems to prevent it from working.

Having made the change, restart dhcpcd (the DHCP Client Daemon) and check the results:
```shell
~$ sudo service dhcpcd restart
~$ route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         www.routerlogin 0.0.0.0         UG    303    0        0 wlan0
default         10.101.1.1      0.0.0.0         UG    402    0        0 eth0
10.101.0.0      *               255.255.0.0     U     402    0        0 eth0
192.168.1.0     *               255.255.255.0   U     303    0        0 wlan0
```

There's also an interesting clip from [man dhcpcd.conf (5)](https://www.daemon-systems.org/man/dhcpcd.conf.5.html), which explains why dhcpcd is assigning the wireless interface the higher metric:
```
metric metric
        Metrics are used to prefer an interface over another one, lowest
        wins.  dhcpcd will supply a default metric of 200 +
        if_nametoindex(3).  An extra 100 will be added for wireless
        interfaces.
```

-----

As a side note, there's some interesting information about the various configuration files used for network interfaces (`/etc/network/interfaces`, `/etc/dhcpcd.conf` and `/etc/wpa_supplicant/wpa_supplicant.conf`), and the differences between (Raspbian) Wheezy and Jessie in [this answer, here](http://raspberrypi.stackexchange.com/questions/39785/dhcpcd-vs-etc-network-interfaces#answer-41187).
