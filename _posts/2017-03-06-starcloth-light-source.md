---
title: Starcloth Light Source
categories: Theatre-Royal
tags: DMX
excerpt: DMX Control details for our LED Starcloth Light Sources
read_time: false
modified:
 - 2017-04-05
last_modified_at: 2017-04-29
---

Model: LEE-1001DMX  
Description: 10W LED DMX Illuminator / LED Light Engine  
Manual: [http://www.wiedamark.com/10wattDMX.pdf](http://www.wiedamark.com/10wattDMX.pdf)

## Dip Switches

- 1-8: DMX address (note: can therefore only be DMX 1-255), or Program Number
- 9: Unused?
- 10:  Radio Remote Control enable - leave off for DMX control, or to set Program Number with Dip switches 1-8
- 11:  Master / Slave - leave off to be a Slave or for DMX control (address set via Dip switches 1-8, or maybe possible via Radio Remote?); turn on for Manual control, and/or to be a Master (Program Number set via Dip Switches 1-8 or with Radio Remote) - the unit will output something (DMX?) for any Slaves to follow
- 12:  Not used (described as 'optional' in the manual!)

Note: Turning Dip 11 on or off causes the unit to reset itself (LED light goes off and wheels spin around to home themselves - takes ~5s)

Note: the LED by the Dip switches flashes when receiving DMX, or when Dip 11 is on (sending DMX..??)

## DMX Control

Address can be set to DMX 1-255 via dip switches 1-8 - doesn't work with a base address of 256 or above!  Ensure Dip switches 9-12 are off.

### ch. 1

| Value   | DMX     | Colour                                   |
|:-------:|:-------:|:-----------------------------------------|
| 0-8%    | 0-20    | open white                               |
| 9-16%   | 21-41   | pale blue                                |
| 17-24%  | 42-62   | green                                    |
| 25-32%  | 63-83   | yellow                                   |
| 33-40%  | 84-104  | dark blue                                |
| 41-49%  | 105-125 | purple                                   |
| 50%     | 126-128 | open white                               |
| 51-100% | 129-255 | colour cycle, fast-slow (order as above) |

### ch. 2

Does nothing..?? - May be Colour Fine..??

### ch. 3

| Value   | DMX     | Intensity                           |
|:-------:|:-------:|:------------------------------------|
| 0-51%   | 0-131   | intensity, off-full                 |
| 52-100% | 132-255 | strobe, fast-slow (full brightness) |

### ch. 4

| Value   | DMX     | Twinkle             |
|:-------:|:-------:|:--------------------|
| 0       | 0       | no twinkle          |
| 1-100%  | 1-255   | twinkle, fast-slow  |

### ch. 5

Does nothing..?? - May be Twinkle Fine..??

## Radio Remote Control

Set Dip Switch 10 and 11 on, and turn all the rest off.

On the remote control, press the Clear or Cancel key to clear any previous programs.  Then choose program from chart below and press corresponding number, then press enter key.  If the program number is larger than the keys on remote, then press multiple numbers to make up the program nuber you want - for example:
- You want program 7. Press cancel then key 6 key 1 then enter. (6 + 1 = 7)
- You want program 9. Press cancel then key 4 key 5, or key 3 key 6, then enter (4 + 5 = 9) or (3 + 6 = 9)
- You want program 18. Press cancel then key 6, 6, 6 then enter. (6 + 6 + 6 = 18) Or push key 1 18 times(!) then enter

## Manual Control / Program Numbers

Set Dip Switch 11 on, 6-10 and 12 off, and 1-6 as follows:

| Prog. No | 6 | 5 | 4 | 3 | 2 | 1 | Static Colour                                                                   |
|:--------:|:-:|:-:|:-:|:-:|:-:|:-:|:--------------------------------------------------------------------------------|
| 1        | 0 | 0 | 0 | 0 | 0 | 1 | White                                                                           |
| 2        | 0 | 0 | 0 | 0 | 1 | 0 | 'Sky' Blue                                                                      |
| 3        | 0 | 0 | 0 | 0 | 1 | 1 | Green                                                                           |
| 4        | 0 | 0 | 0 | 1 | 0 | 0 | Yellow                                                                          |
| 5        | 0 | 0 | 0 | 1 | 0 | 1 | Dark Blue                                                                       |
| 6        | 0 | 0 | 0 | 1 | 1 | 0 | Purple                                                                          |

| Prog. No | 6 | 5 | 4 | 3 | 2 | 1 | Colour flash change (Wh->SB->Gr->Ye->DB->Pu->DB->Ye->Gr->SB->Wh)                |
|:--------:|:-:|:-:|:-:|:-:|:-:|:-:|:--------------------------------------------------------------------------------|
| 7        | 0 | 0 | 0 | 1 | 1 | 1 | 2s per step                                                                     |
| 8        | 0 | 0 | 1 | 0 | 0 | 0 | 5s per step                                                                     |
| 9        | 0 | 0 | 1 | 0 | 0 | 1 | 10s per step                                                                    |

| Prog. No | 6 | 5 | 4 | 3 | 2 | 1 | Colour cycle             | speed    | Twinkle             | speed    | Strobe          |
|:--------:|:-:|:-:|:-:|:-:|:-:|:-:|:------------------------:|:--------:|:-------------------:|:--------:|:---------------:|
| 10       | 0 | 0 | 1 | 0 | 1 | 0 | V.Slow Colour cycle      | 0.88 RPM | Slow Twinkle        | 1.54 RPM |                 |
| 11       | 0 | 0 | 1 | 0 | 1 | 1 | Slow Colour cycle        | 1.5 RPM  | Slow Twinkle        | 1.54 RPM |                 |
| 12       | 0 | 0 | 1 | 1 | 0 | 0 | Medium Colour cycle      | 2.65 RPM | Slow Twinkle        | 1.54 RPM |                 |
| 13       | 0 | 0 | 1 | 1 | 0 | 1 | V.Slow Colour cycle      | 0.88 RPM | Medium Twinkle      | 2.65 RPM |                 |
| 14       | 0 | 0 | 1 | 1 | 1 | 0 | Slow Colour cycle        | 1.5 RPM  | Medium Twinkle      | 2.65 RPM |                 |
| 15       | 0 | 0 | 1 | 1 | 1 | 1 | Medium Colour cycle      | 2.65 RPM | Medium Twinkle      | 2.65 RPM |                 |
| 16       | 0 | 1 | 0 | 0 | 0 | 0 | V.Slow Colour cycle      | 0.88 RPM | Fast Twinkle        | 5.1 RPM  |                 |
| 17       | 0 | 1 | 0 | 0 | 0 | 1 | Slow Colour cycle        | 1.5 RPM  | Fast Twinkle        | 5.1 RPM  |                 |
| 18       | 0 | 1 | 0 | 0 | 1 | 0 | Medium Colour cycle      | 2.65 RPM | Fast Twinkle        | 5.1 RPM  |                 |
| 19       | 0 | 1 | 0 | 0 | 1 | 1 | V.V.Slow Colour cycle    | 0.1 RPM  | V.V.Slow Twinkle    | 0.1 RPM  |                 |
| 20       | 0 | 1 | 0 | 1 | 0 | 0 | V.V.Slow Colour cycle    | 0.1 RPM  | V.Slow Twinkle      | 0.9 RPM  |                 |
| 21       | 0 | 1 | 0 | 1 | 0 | 1 | V.V.Slow Colour cycle    | 0.1 RPM  | Slow Twinkle        | 1.54 RPM |                 |
| 22       | 0 | 1 | 0 | 1 | 1 | 0 | V.V.Slow Colour cycle    | 0.1 RPM  | Medium Twinkle      | 2.65 RPM |                 |
| 23       | 0 | 1 | 0 | 1 | 1 | 1 | V.V.Slow Colour cycle    | 0.1 RPM  | Fast Twinkle        | 5.1 RPM  |                 |
| 24       | 0 | 1 | 1 | 0 | 0 | 0 | Fast Colour cycle        | 5.1 RPM  | Fast Twinkle        | 5.1 RPM  |                 |
| 25       | 0 | 1 | 1 | 0 | 0 | 1 | V.Fast Colour cycle      | 9.5 RPM  | V.Fast Twinkle      | 9.5 RPM  |                 |
| 26       | 0 | 1 | 1 | 0 | 1 | 0 | Slow-Medium Colour cycle | 1.78 RPM | V.Fast Twinkle      | 9.5 RPM  |                 |
| 27       | 0 | 1 | 1 | 0 | 1 | 1 | Medium-Slow Colour cycle | 2.1 RPM  | V.Fast Twinkle      | 9.5 RPM  |                 |
| 28       | 0 | 1 | 1 | 1 | 0 | 0 | Medium Colour cycle      | 2.65 RPM | V.Fast Twinkle      | 9.5 RPM  |                 |
| 29       | 0 | 1 | 1 | 1 | 0 | 1 | Medium-Fast Colour cycle | 3.5 RPM  | V.Fast Twinkle      | 9.5 RPM  |                 |
| 30       | 0 | 1 | 1 | 1 | 1 | 0 | Fast Colour cycle        | 5.1 RPM  | V.Fast Twinkle      | 9.5 RPM  |                 |
| 31       | 0 | 1 | 1 | 1 | 1 | 1 | V.Fast Colour cycle      | 9.5 RPM  | V.Fast Twinkle      | 9.5 RPM  |                 |
| 32       | 1 | 0 | 0 | 0 | 0 | 0 | Fast Colour cycle        | 5.1 RPM  | V.Fast Twinkle      | 9.5 RPM  |                 |
| 33       | 1 | 0 | 0 | 0 | 0 | 1 | Medium-Fast Colour cycle | 3.5 RPM  | Fast Twinkle        | 5.1 RPM  |                 |
| 34       | 1 | 0 | 0 | 0 | 1 | 0 | Medium Colour cycle      | 2.65 RPM | Fast Twinkle        | 5.1 RPM  |                 |
| 35       | 1 | 0 | 0 | 0 | 1 | 1 | V.Fast Colour cycle      | 9.5 RPM  | Medium-Fast Twinkle | 3.5 RPM  |                 |
| 36       | 1 | 0 | 0 | 1 | 0 | 0 | Fast Colour cycle        | 5.1 RPM  | Medium-Fast Twinkle | 3.5 RPM  |                 |
| 37       | 1 | 0 | 0 | 1 | 0 | 1 | Medium-Fast Colour cycle | 3.5 RPM  | Medium-Fast Twinkle | 3.5 RPM  |                 |
| 38       | 1 | 0 | 0 | 1 | 1 | 0 | Medium Colour cycle      | 2.65 RPM | Medium-Fast Twinkle | 3.5 RPM  |                 |
| 39       | 1 | 0 | 0 | 1 | 1 | 1 | V.Fast Colour cycle      | 9.5 RPM  | Medium Twinkle      | 2.65 RPM |                 |
| 40       | 1 | 0 | 1 | 0 | 0 | 0 | Fast Colour cycle        | 5.1 RPM  | Medium Twinkle      | 2.65 RPM |                 |
| 41       | 1 | 0 | 1 | 0 | 0 | 1 | Medium-Fast Colour cycle | 3.5 RPM  | Medium Twinkle      | 2.65 RPM |                 |
| 42       | 1 | 0 | 1 | 0 | 1 | 0 | Medium Colour cycle      | 2.65 RPM | Medium Twinkle      | 2.65 RPM |                 |
| 43       | 1 | 0 | 1 | 0 | 1 | 1 | V.Fast Colour cycle      | 9.5 RPM  | Slow-Medium Twinkle | 1.78 RPM |                 |
| 44       | 1 | 0 | 1 | 1 | 0 | 0 | Fast Colour cycle        | 5.1 RPM  | Slow-Medium Twinkle | 1.78 RPM |                 |
| 45       | 1 | 0 | 1 | 1 | 0 | 1 | Medium-Fast Colour cycle | 3.5 RPM  | Slow-Medium Twinkle | 1.78 RPM |                 |
| 46       | 1 | 0 | 1 | 1 | 1 | 0 | Medium Colour cycle      | 2.65 RPM | Slow-Medium Twinkle | 1.78 RPM |                 |
| 47       | 1 | 0 | 1 | 1 | 1 | 1 | V.Fast Colour cycle      | 9.5 RPM  | V.Fast Twinkle      | 9.5 RPM  | Strobe (0.65Hz) |
| 48       | 1 | 1 | 0 | 0 | 0 | 0 | Fast Colour cycle        | 5.1 RPM  | V.Fast Twinkle      | 9.5 RPM  | Strobe (0.65Hz) |
| 49       | 1 | 1 | 0 | 0 | 0 | 1 | Medium-Fast Colour cycle | 3.5 RPM  | V.Fast Twinkle      | 9.5 RPM  | Strobe (0.65Hz) |
| 50       | 1 | 1 | 0 | 0 | 1 | 0 | Medium Colour cycle      | 2.65 RPM | V.Fast Twinkle      | 9.5 RPM  | Strobe (0.65Hz) |


|             |         | Colour:   | V.V.Slow  | V.Slow    | Slow      | Slow-Medium | Medium-Slow | Medium    | Medium-Fast | Fast       | V.Fast   |
|             |         |           | 0.1RPM    | 0.88RPM   | 1.5RPM    | 1.78RPM     | 2.1RPM      | 2.65RPM   | 3.5RPM      | 5.1RPM     | 9.5RPM   |
|             |         |           | 10:10/rev | 68s/rev   | ~40s/rev  | 33.7s/rev   | 28.4s/rev   | 22.7s/rev | 17.14s/rev  | 11.75s/rev | 6.3s/rev |
| Twinkle:    |         |           | 1:42/col  | 11.3s/col | ~6.7s/col | 5.6s/col    | 4.7s/col    | 3.8s/col  | 2.9s/col    | 2.0s/col   | 1.0s/col |
|:-----------:|:-------:|:---------:|:---------:|:---------:|:---------:|:-----------:|:-----------:|:---------:|:-----------:|:----------:|:--------:|
| V.V.Slow    | 0.1RPM  | 10:10/rev | 19        |           |           |             |             |           |             |            |          |
| V.Slow      | 0.9RPM  | 66.6s/rev | 20        |           |           |             |             |           |             |            |          |
| Slow        | 1.54RPM | 38.9s/rev | 21        | 10        | 11        |             |             | 12        |             |            |          |
| Slow-Medium | 1.78RPM | 33.7s/rev |           |           |           |             |             | 46        | 45          | 44         | 43       |
| Medium      | 2.65RPM | 22.7s/rev | 22        | 13        | 14        |             |             | 15 / 42   | 41          | 40         | 39       |
| Medium-Fast | 3.5RPM  | 17s/rev   |           |           |           |             |             | 38        | 37          | 36         | 35       |
| Fast        | 5.1RPM  | 11.7s/rev | 23        | 16        | 17        |             |             | 18 / 34   | 33          | 24         |          |
| V.Fast      | 9.5RPM  | 6.3s/rev  |           |           |           | 26          | 27          | 28 / 50(Str) | 29 / 49(Str)   | 30 / 32 / 48(Str) | 25 / 31 / 47(Str) |


## Slave unit

To work well as a Slave unit, turn Dip switch 1 on and all the others off - note: this is the same setting as for DMX Control with DMX Address 1

The 'Slave Address' can be set to anything, but odd things seem to happen if it is not a multiple of 5, plus 1 (ie. 1, 6, 11, etc)...

If Dip switch 10 is on and switch 11 is off, then Dip switches 1-8 are ignored and the 'Slave Address' is set by the Radio Remote Control

| Slave Address | Colour     | Ch. 2        | Intensity/Strobe | Twinkle    | Ch. 5        |
|:-------------:|:----------:|:------------:|:----------------:|:----------:|:------------:|
| 1             | Colour     | (*Colour?*)  | Intensity        | Twinkle    | (*Twinkle?*) |
| 2             | *Colour?*  | (Intensity?) | Twinkle          | *Twinkle?* | (Colour?)    |
| 3             | Intensity  | (Twinkle?)   | *Twinkle?*       | Colour     | (*Colour?*)  |
| 4             | Twinkle    | (*Twinkle?*) | Colour           | *Colour?*  | (Intensity?) |
| 5             | *Twinkle?* | (Colour?)    | *Colour?*        | Intensity  | (Twinkle?)   |
| 6             | Colour     | (*Colour?*)  | Intensity        | Twinkle    | (*Twinkle?*) |
