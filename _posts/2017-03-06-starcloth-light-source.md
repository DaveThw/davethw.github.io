---
title: Starcloth Light Source
categories: Theatre-Royal
tags: DMX
excerpt: DMX Control details for our LED Starcloth Light Sources
read_time: false
modified: 2017-04-05
---

Model: LEE-1001DMX  
Description: 10W LED DMX Illuminator / LED Light Engine  
Manual: [http://www.wiedamark.com/10wattDMX.pdf](http://www.wiedamark.com/10wattDMX.pdf)

## Dip Switches

- 1-9: DMX address (note: can therefore only be DMX 1-255), or Program Number
- 10:  Radio Remote Control enable - leave off for DMX control
- 11:  Master / Slave - leave off for DMX control, or to be a slave, turn on to be master for non-DMX control (may also need to be on for radio remote control to work..?)
- 12:  Not used (described as 'optional' in the manual!)


## DMX address

Can be set to DMX 1-255 via dip switches 1-8 - doesn't work with a base address of 256 or above!

### ch. 1

| Value   | DMX     | Colour           |
|:-------:|:-------:|:-----------------|
| 0-8%    | 0-20    | open white       |
| 9-16%   | 21-41   | pale blue        |
| 17-24%  | 42-62   | green            |
| 25-32%  | 63-83   | yellow           |
| 33-40%  | 84-104  | dark blue        |
| 41-49%  | 105-125 | purple           |
| 50%     | 126-128 | open white       |
| 51-100% | 129-255 | colour cycle, fast-slow (order as above) |

### ch. 2

Does nothing..??

### ch. 3

| Value   | DMX     | Intensity           |
|:-------:|:-------:|:--------------------|
| 0-51%   | 0-131   | intensity, off-full |
| 52-100% | 132-255 | strobe, fast-slow (full brightness) |

### ch. 4

| Value   | DMX     | Twinkle             |
|:-------:|:-------:|:--------------------|
| 0       | 0       | no twinkle          |
| 1-100%  | 1?-255  | twinkle, fast-slow  |

## Radio Remote Control

Set Dip Switch 10 and 11 on, and turn all the rest off.

On the remote control, press the Clear or Cancel key to clear any previous programs.  Then choose program from chart below and press corresponding number, then press enter key.  If the program number is larger than the keys on remote, then press multiple numbers to make up the program nuber you want - for example:
- You want program 7. Press cancel then key 6 key 1 then enter. (6 + 1 = 7)
- You want program 9. Press cancel then key 4 key 5, or key 3 key 6, then enter (4 + 5 = 9) or (3 + 6 = 9)
- You want program 18. Press cancel then key 6, 6, 6 then enter. (6 + 6 + 6 = 18) Or push key 1 18 times(!) then enter

## Manual Control / Program Numbers

Set Dip Switch 11 on, 6-10 and 12 off, and 1-5 as follows:

| Prog. No | 5 | 4 | 3 | 2 | 1 | Description                                               |
|:--------:|:-:|:-:|:-:|:-:|:-:|:----------------------------------------------------------|
| 1        | 0 | 0 | 0 | 0 | 1 | White                                                     |
| 2        | 0 | 0 | 0 | 1 | 0 | 'Sky' Blue                                                |
| 3        | 0 | 0 | 0 | 1 | 1 | Green                                                     |
| 4        | 0 | 0 | 1 | 0 | 0 | Yellow                                                    |
| 5        | 0 | 0 | 1 | 0 | 1 | Dark Blue                                                 |
| 6        | 0 | 0 | 1 | 1 | 0 | Purple                                                    |
| 7        | 0 | 0 | 1 | 1 | 1 | Colour cycle(?) (2s)                                      |
| 8        | 0 | 1 | 0 | 0 | 0 | Colour cycle(?) (5s)                                      |
| 9        | 0 | 1 | 0 | 0 | 1 | Colour cycle(?) (10s)                                     |
| 10       | 0 | 1 | 0 | 1 | 0 | Slow Colour cycle (0.5 RPM) + Slow(?) Twinkle (1.5 RPM)   |
| 11       | 0 | 1 | 0 | 1 | 1 | Slow Colour cycle (1.5 RPM) + Slow(?) Twinkle (1.5 RPM)   |
| 12       | 0 | 1 | 1 | 0 | 0 | Slow Colour cycle (2.5 RPM) + Slow(?) Twinkle (1.5 RPM)   |
| 13       | 0 | 1 | 1 | 0 | 1 | Slow Colour cycle (0.5 RPM) + Medium(?) Twinkle (2.5 RPM) |
| 14       | 0 | 1 | 1 | 1 | 0 | Slow Colour cycle (1.5 RPM) + Medium(?) Twinkle (2.5 RPM) |
| 15       | 0 | 1 | 1 | 1 | 1 | Slow Colour cycle (2.5 RPM) + Medium(?) Twinkle (2.5 RPM) |
| 16       | 1 | 0 | 0 | 0 | 0 | Slow Colour cycle (0.5 RPM) + Fast(?) Twinkle (5 RPM)     |
| 17       | 1 | 0 | 0 | 0 | 1 | Slow Colour cycle (1.5 RPM) + Fast(?) Twinkle (5 RPM)     |
| 18       | 1 | 0 | 0 | 1 | 0 | Slow Colour cycle (2.5 RPM) + Fast(?) Twinkle (5 RPM)     |
