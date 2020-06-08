---
title: Robin Pointe Fixture (for ETC Ion)
categories: Notes
tags: DMX Theatre-Royal
excerpt: Fixture details for Robe's Robin Pointe Moving Heads
read_time: false
# last_modified_at: 2018-01-14
---

## Robin Pointe Fixture, from our Ion

### Main Fixture

| Number | Parameter                  | Size    | DMX | LDMX | Home  | Snap    | Ranges |
|:------:|:--------------------------:|:-------:|:---:|:----:|:-----:|:-------:|:------:|
| 1      | Pan                        | 16 Bits | 1   | 2    | 32768 |         | 1      |
| 2      | Tilt                       | 16 Bits | 3   | 4    | 32768 |         | 1      |
| 3      | Position MSpeed            | 8 Bits  | 5   |      | 0     | Enabled | 1      |
| 4      | Lamp Control               | 8 Bits  | 6   |      | 0     |         | 1      |
| 5      | Color Select               | 16 Bits | 7   | 8    | 0     | Enabled | 14     |
| 6      | Gobo Wheel Select MSpeed 2 | 8 Bits  | 9   |      | 0     | Enabled | 1      |
| 7      | Gobo Select                | 8 Bits  | 10  |      | 0     | Enabled | 15     |
| 8      | Gobo Select 2              | 8 Bits  | 11  |      | 0     | Enabled | 11     |
| 9      | Gobo Index/Speed 2         | 16 Bits | 12  | 13   | 32767 |         | 1      |
| 10     | Beam Fx Select             | 8 Bits  | 14  |      | 0     |         | 3      |
| 11     | Beam Fx Index/Speed        | 8 Bits  | 15  |      | 127   | Enabled | 1      |
| 12     | Diffusion                  | 8 Bits  | 16  |      | 0     |         | 1      |
| 13     | Zoom                       | 16 Bits | 17  | 18   | 65535 |         | 1      |
| 14     | Edge                       | 16 Bits | 19  | 20   | 65535 |         | 1      |
| 15     | Edge 2                     | 8 Bits  | 21  |      | 0     |         | 1      |
| 16     | Shutter Strobe             | 8 Bits  | 22  |      | 255   | Enabled | 1      |
| 17     | Intens                     | 16 Bits | 23  | 24   | 0     |         | 1      |
| 18     | Color Wheel Mode           |         |     |      | 25    | Enabled | 5      |
| 19     | Gobo Wheel Mode            |         |     |      | 25    | Enabled | 5      |
| 20     | Gobo Wheel Mode 2          |         |     |      | 13    | Enabled | 9      |
| 21     | Beam Fx Wheel Mode         |         |     |      | 42    | Enabled | 3      |
| 22     | Diffusion Mode             |         |     |      | 31    | Enabled | 4      |
| 23     | Strobe Mode                |         |     |      | 53    | Enabled | 7      |

### Pan Range

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 65535 | -225     | 225      | -225 to 225 D |

### Tilt Range

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 65535 | -135     | 135      | -135 to 135 D |

### Position MSpeed Range

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 255   | 0        | 225      |               |

### Lamp Control Range

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 255   | 0        | 225      | No Feature    |

### Colour Select Ranges

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 1279  | 0.5      | 1.5      | open          |
| 1280  | 3583  | 1.5      | 2.5      | color 1       |
| 3584  | 5887  | 2.5      | 3.5      | color 2       |
| 5888  | 8447  | 3.5      | 4.5      | color 3       |
| 8448  | 10751 | 4.5      | 5.5      | color 4       |
| 10752 | 13055 | 5.5      | 6.5      | color 5       |
| 13056 | 15359 | 6.5      | 7.5      | color 6       |
| 15360 | 17663 | 7.5      | 8.5      | color 7       |
| 17664 | 19967 | 8.5      | 9.5      | color 8       |
| 19968 | 22271 | 9.5      | 10.5     | color 9       |
| 22272 | 24831 | 10.5     | 11.5     | color 10      |
| 24832 | 27135 | 11.5     | 12.5     | color 11      |
| 27136 | 29439 | 12.5     | 13.5     | color 12      |
| 29440 | 32767 | 13.5     | 14.4     | color 13      |

### Gobo Wheel Select MSpeed 2 Range

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 255   | 0        | 225      | D#2           |

### Gobo Select Ranges

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 3     | 0.5      | 1.5      | open          |
| 4     | 9     | 1.5      | 2.5      | gobo 1        |
| 10    | 15    | 2.5      | 3.5      | gobo 2        |
| 16    | 21    | 3.5      | 4.5      | gobo 3        |
| 22    | 27    | 4.5      | 5.5      | gobo 4        |
| 28    | 33    | 5.5      | 6.5      | gobo 5        |
| 34    | 39    | 6.5      | 7.5      | gobo 6        |
| 40    | 45    | 7.5      | 8.5      | gobo 7        |
| 46    | 51    | 8.5      | 9.5      | gobo 8        |
| 52    | 57    | 9.5      | 10.5     | gobo 9        |
| 58    | 63    | 10.5     | 11.5     | gobo 10       |
| 64    | 69    | 11.5     | 12.5     | gobo 11       |
| 70    | 75    | 12.5     | 13.5     | gobo 12       |
| 76    | 81    | 13.5     | 14.5     | gobo 13       |
| 82    | 87    | 14.5     | 15.4     | gobo 14       |

### Gobo Select 2 Ranges

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 0     | 0.5      | 1.5      | open          |
| 1     | 4     | 1.5      | 2.5      | gobo 1        |
| 5     | 7     | 2.5      | 3.5      | gobo 2        |
| 8     | 10    | 3.5      | 4.5      | gobo 3        |
| 11    | 13    | 4.5      | 5.5      | gobo 4        |
| 14    | 16    | 5.5      | 6.5      | gobo 5        |
| 17    | 19    | 6.5      | 7.5      | gobo 6        |
| 20    | 22    | 7.5      | 8.5      | gobo 7        |
| 23    | 25    | 8.5      | 9.5      | gobo 8        |
| 26    | 28    | 9.5      | 10.5     | gobo 9        |
| 29    | 31    | 10.5     | 11.4     | gobo 10       |

### Gobo Index/Speed 2 Range

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 65535 | -100     | 100      | Index         |

### Beam Fx Select Ranges

| Min    | Max   | User Min | User Max | Label         |
|:------:|:-----:|:--------:|:--------:|:--------------|
| 0      | 19    | 0.5      | 1.5      | open          |
| 20     | 49    | 1.5      | 2.5      | effect 1      |
| **76** | 105   | 2.5      | 3.4      | effect 2      |

### Beam Fx Index/Speed Range

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 0     | 255   | -100     | 100      | %             |

### Diffusion Range

| Min   | Max     | User Min | User Max | Label         |
|:-----:|:-------:|:--------:|:--------:|:--------------|
| 0     | **189** | 0        | 100      |               |

### Zoom Range

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 65535 | 0     | 2        | 20       | 2 to 20 D     |

### Edge Range

| Min   | Max   | User Min | User Max | Label         |
|:-----:|:-----:|:--------:|:--------:|:--------------|
| 65535 | 0     | 0        | 100      | %             |

### Edge 2 Range

| Min   | Max   | User Min | User Max | Label               |
|:-----:|:-----:|:--------:|:--------:|:--------------------|
| 127   | 0     | 0        | 100      | 1 to 100% Edge Auto |

### Shutter Strobe Range

| Min   | Max    | User Min | User Max | Label           |
|:-----:|:------:|:--------:|:--------:|:----------------|
| 0     | **31** | 0        | 31       | Closed Lamp 50% |

### Intens Range

| Min   | Max   | User Min | User Max | Label           |
|:-----:|:-----:|:--------:|:--------:|:----------------|
| 0     | 65535 | 0        | 100      | %               |

### Colour Wheel Mode Ranges

| Min   | Max   | User Min | User Max | Label             |
|:-----:|:-----:|:--------:|:--------:|:------------------|
| 0     | 50    | 0        | 50       | Cont              |
| 51    | 101   | 51       | 101      | Snap              |
| 102   | 152   | 102      | 152      | Spin 100 to -100% |
| 153   | 203   | 153      | 203      | Audio +           |
| 204   | 255   | 204      | 255      | Random +          |

### Gobo Wheel Mode Ranges

| Min   | Max   | User Min | User Max | Label             |
|:-----:|:-----:|:--------:|:--------:|:------------------|
| 0     | 50    | 0        | 50       | Snap              |
| 51    | 101   | 51       | 101      | Shake +           |
| 102   | 152   | 102      | 152      | Spin              |
| 153   | 203   | 153      | 203      | Audio +           |
| 204   | 255   | 204      | 255      | Random +          |

### Gobo Wheel Mode 2 Ranges

| Min   | Max   | User Min | User Max | Label             |
|:-----:|:-----:|:--------:|:--------:|:------------------|
| 0     | 27    | 0        | 27       | Index             |
| 28    | 55    | 28       | 55       | Rot               |
| 56    | 84    | 56       | 84       | Index Shake +     |
| 85    | 112   | 85       | 112      | Rot Shake +       |
| 113   | 140   | 113      | 140      | Spin + Rot        |
| 141   | 169   | 141      | 169      | Rot 2             |
| 170   | 197   | 170      | 197      | Spin - Rot        |
| 198   | 225   | 198      | 225      | Audio 100% Rot    |
| 226   | 255   | 226      | 255      | Random + Rot      |

### Beam Fx Wheel Mode Ranges

| Min   | Max   | User Min | User Max | Label             |
|:-----:|:-----:|:--------:|:--------:|:------------------|
| 0     | 84    | 0        | 84       | Index             |
| 85    | 169   | 85       | 169      | Rot               |
| 170   | 255   | 170      | 255      | Macros            |

### Diffusion Mode Ranges

| Min   | Max   | User Min | User Max | Label             |
|:-----:|:-----:|:--------:|:--------:|:------------------|
| 0     | 62    | 0        | 62       | +                 |
| 63    | 126   | 63       | 126      | Pulse Dec +       |
| 127   | 190   | 127      | 190      | Pulse Inc +       |
| 191   | 255   | 191      | 255      | Pulse +           |

### Strobe Mode Ranges

| Min   | Max   | User Min | User Max | Label             |
|:-----:|:-----:|:--------:|:--------:|:------------------|
| 0     | 35    | 0        | 35       | Closed Lamp +     |
| 36    | 71    | 36       | 71       | Lamp +            |
| 72    | 108   | 72       | 108      | Strobe            |
| 109   | 144   | 109      | 144      | Open              |
| 145   | 181   | 145      | 181      | Pulse Open +      |
| 182   | 217   | 182      | 217      | Pulse Close +     |
| 218   | 255   | 218      | 255      | Rnd +             |

### Lamp Controls

| Lamp Control                  | Steps | Time (s) | Num. of Levels | DMX Number | DMX Level | DMX Number | DMX Level |
|:-----------------------------:|:-----:|:--------:|:--------------:|:----------:|:---------:|:----------:|:---------:|
| Lamp On                       | 1     | 4        | 1              | 6          | 134       |            |           |
| Lamp Off                      | 1     | 4        | 1              | 6          | 234       |            |           |
| Lamp Power 100                | 1     | 4        | 2              | 6          | 27        | 22         | 15        |
| Lamp Power 50                 | 1     | 4        | 2              | 6          | 22        | 22         | 15        |
| Colour Wheel Reset            | 1     | 24       | 1              | 6          | 154       |            |           |
| Fixture Global Reset          | 1     | 44       | 1              | 6          | 204       |            |           |
| Fixture Non Position Reset    | 1     | 44       | 1              | 6          | 134       |            |           |
| Form Image Reset              | 1     | 24       | 1              | 6          | 184       |            |           |
| Form Intensity Reset          | 1     | 24       | 1              | 6          | 174       |            |           |
| Image Reset                   | 1     | 24       | 1              | 6          | 164       |            |           |
| Position Reset                | 1     | 44       | 1              | 6          | 144       |            |           |
| Position Blink off            | 1     | 4        | 2              | 6          | 84        | 22         | 15        |
| Position Blink on             | 1     | 4        | 2              | 6          | 74        | 22         | 15        |
| Position MSpeed Mode Time     | 1     | 4        | 2              | 6          | 64        | 22         | 15        |
| Position MSpeed Mode Track    | 1     | 4        | 2              | 6          | 54        | 22         | 15        |
| Colour Wheel Select Blink off | 1     | 4        | 2              | 6          | 104       | 22         | 15        |
| Colour Wheel Select Blink on  | 1     | 4        | 2              | 6          | 94        | 22         | 15        |
| Gobo Wheel Select Blink off   | 1     | 4        | 2              | 6          | 124       | 22         | 15        |
| Gobo Wheel Select Blink on    | 1     | 4        | 2              | 6          | 114       | 22         | 15        |
| Wired DMX                     | 1     | 4        | 2              | 6          | 12        | 22         | 15        |
| Wireless DMX                  | 1     | 4        | 2              | 6          | 17        | 22         | 15        |

