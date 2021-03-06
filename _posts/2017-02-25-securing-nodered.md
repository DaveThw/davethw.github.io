---
# layout: post
title: Securing Node-RED connections (HTTPS / WSS)
categories: Theatre-Royal EOS-Remote
tags: RaspberryPi Node-RED
excerpt: Step-by-step notes going through the process of enabling secure connections for Node-RED
last_modified_at: 2017-04-05
---
So, if I am potentially going to host developemnt of my [remote app for the Ion](https://github.com/DaveThw/EOSRemote) on GitHub it'll be very useful to preview new features as I'm working on it, but GitHub Pages [serves it over HTTPS](https://davethw.github.io/EOSRemote/).  And you can't open a standard websocket connection (ws://...) from an HTTPS page (probably wise!), only a secure one (wss://...).  Therefore I need to enable secure connections on Node-RED.

Following a combination of [instructions from here](http://industrialinternet.co.uk/node-red/adding-https-ssl-to-node-red/), and [5 tips from here](http://blog.httpwatch.com/2013/12/12/five-tips-for-using-self-signed-ssl-certificates-with-ios/), and [more instructions from here](https://www.hardill.me.uk/wordpress/2015/05/11/securing-node-red/)...

**Update:** My Chromebook seemed happy to install a self-signed certificate as an Authority, but when I tried that on Safari on an iPad it didn't seem to recognise the website as being signed by the same certificate, and I couldn't work out how to tell the iPad to trust that certificate to authenticate websites - so it looks worth while going through the (very slightly) longer process of creating your own personal Certificate Authority certificate.  My Chromebook would only recognise this CA certificate with the .pem extension, not the .cer one I initially gave it...

**Update:** I've now re-made the server certifiace with the Common Name set to the IP address of the Raspberry Pi on the sound network - this makes everything happy on that network (either getting the app from the Raspberry Pi, or from GitHub), and I think I now also plan to serve the app (mainly on the LX network, but maybe also on the sound network?) with a separate HTTP server (maybe NGINX...), mainly to make life easier with the Hudl.

## Create Certificates for Node-RED to use

```shell
~$ cd .node-red
~/.node-red$ mkdir public
~/.node-red$ cd public
```
Generate a key for my personal Certificate Authority:
```shell
~/.node-red/public$ openssl genrsa -out myCA.key 2048
```
Generate a Certificate Authority certificate:
```shell
~/.node-red/public$ openssl req -x509 -sha256 -new -key myCA.key -out myCA.cer -days 365 -subj /CN="Dave Thwaites CA"
```
*(note: with the `-subj /CN=` parameters, we don't get asked for details for the certificate)*

Generate a priate key:
```shell
~/.node-red/public$ openssl genrsa -out privatekey.pem 1024
```
Create a Client Signing Request:
```shell
~/.node-red/public$ openssl req -new -key privatekey.pem -out private-csr.req
```
*(this will ask for some details for the certificate - the Common Name might need to be set to the address of the server...)*

~~Finally create the certificate (self-signed(?)):~~
```shell
~/.node-red/public$ openssl x509 -req -sha256 -days 365 -in private-csr.req -signkey privatekey.pem -out certificate.pem
```
Finally create the certificate, signed by my personal CA:
```shell
~/.node-red/public$ openssl x509 -req -sha256 -in private-csr.req -out certificate.pem -CAkey myCA.key -CA myCA.cer -days 365 -CAcreateserial -CAserial serial
```

## Tell Node-RED to use this certificate and serve HTTPS / WSS

Then we need to make some changes to `~/.node-red/settings.js` - near the top, uncomment the line:
```javascript
var fs = require("fs");
```
About two-thirds of the way down, uncomment and modify:
```javascript
    https: {
        key: fs.readFileSync('/home/pi/.node-red/public/privatekey.pem'),
        cert: fs.readFileSync('/home/pi/.node-red/public/certificate.pem')
    },
```
(note: I can't work out where Node-RED is looking for these files - without a full path it seems that Node-RED can't find them when starting up...)

Then re-start Node-RED:
```shell
~$ node-red-stop
~$ node-red-start
```

## Install our Certificate Authority certificate on any devices necessary

Now we should have Node-RED serving its pages over HTTPS, and WebSockets over WSS.  Next we need to install a copy of our CA Certificate onto our browsers / devices.  Maybe place a copy of it in the www folder for easy downloading - or on GitHub...

### For Chrome
(based on instructions [from here](https://www.hardill.me.uk/wordpress/2015/05/11/securing-node-red/#attachment_2086)):

1. Download the certificate from Node-RED (ignoring any security warnings) - needs to have the extension .pem
1. Open Chrome settings page chrome://settings
2. Scroll to the bottom of page and click on the "+Show advanced settings" link
3. Scroll to the HTTPS/SSL and click on "Manage certificates..."
4. Select the Authorities tab and select import
5. Select the downloaded certificate
6. Scroll down to find the new authority in the list (will probably say 'untrusted')
7. Click on 'Edit...'
8. Tick 'Trust this certificate for identifying websites' and click OK.

Which works...  But Chrome is still unhappy with pages served from the Raspberry Pi, because (I think) the Common Name on the sertificate doesn't match the server's address...  I could put one in, but which address (LX or sound network?).  However, it seems to work well for the webpage server from GitHub!  **Update:** Now with the Common Name set to 192.168.1.2 looks fine from the sound network!

### For Safari on iPad
(following tips from [here](http://blog.httpwatch.com/2013/12/12/five-tips-for-using-self-signed-ssl-certificates-with-ios/)):

1. Download the CA certificate
2. Click on Install (then install, then install!..)
3. Then... it just seems to work!
4. Well, works fine on the sound network, but gives a security error on the LX network (because the server name doesn't match the CN on the certificate)

### For Hudl:

1. Need to set a screen lock PIN or pattern to store an user CA certificate...
2. Download the CA Certificate
3. Should install automatically, I think...
4. Then everything seems to work!

However... I've got two probelms with the set up on the Hudl: 1) With the Hudl on the lighting network, we get security errors because the certificate doesn't match the server address, and 2) it's going to get annoying having the pin code to unlock the Hudl regularly...  So, I might find some other way to serve the control app over http for the lighting network only - maybe possible with http nodes in node-red (although will they be https nodes now..?), or otherwise install a separate lightweight http server (maybe [NGINX](https://www.raspberrypi.org/documentation/remote-access/web-server/nginx.md)..?)

### For iPhone 7 (iOS 10.3)

1. Download the CA certificate
2. Click on Install
3. Gives two warnings:
  - Unmanaged Root Certificate: Installing the certificate "Dave Thwaites CA" will add it to the list of trusted certificates on your iPhone. This Certificate will not be trusted for websites until you enable it in Certificate Trust Settings
  - Unverified Profile: The authenticity on "Dave Thwaites CA" cannot be verified
4. Click install
5. Then install again!..
6. Then... it doesn't seem to work...  My https web page still gives a "Cannot Verify Server Identity" error.
7. Ah-ha! - as stated in the Unmanaged Root Certificate warning, you need to enable it on Certificate Trust Settings:
   1. So, go to: Settings -> General -> About -> Certificate Trust Settings - > Turn on toggle button next to "Dave Thwaites CA"
   2. Gives a warning: "Enabling this certificates for websites will allow third parties to view any private data sent to websites"
   3. click Continue
8. And... it works!!
