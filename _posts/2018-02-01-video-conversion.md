---
title: "Video conversion using ffmpeg on Windows"
categories: TheatreRoyal
tags: ffmpeg
excerpt: Step-by-step through using ffmpeg to convert video files (from our video camera) to mp4's
date: 2018-02-01 11:00
---

First, if not yet done, [download ffmpeg](https://ffmpeg.zeranoe.com/builds/) - I went for the latest Release Build (3.4.1), Windows 64-bit, Static.  Once the zip files has downloaded, extract the contents somewhere (Downloads folder works) - note the zip folder contains a directory, which contains everything else, so it's less confusing if you extract directly into Downloads, rather than the subdirectory that the extractor will suggest!..


Our camera records as MPEG-2 Program Stream files, which are a little bulky and are capped at just under 2GB (about 49mins long) - longer recordings are therefore split into multiple files.  Fortunately, according to the [ffmpeg faq](http://www.ffmpeg.org/faq.html#Concatenating-using-the-concat-protocol-_0028file-level_0029), MPEG-2 PS files can just be concatenated together using the huble `copy` command!..


If you want to, confirm that an MPG file is indeed MPEG-PS with:
```shell
C:\Users\Dave>cd Downloads\ffmpeg-3.4.1-win64-static\bin
C:\Users\Dave\Downloads\ffmpeg-3.4.1-win64-static\bin>ffprobe -hide_banner -show_format "C:\Users\Dave\Desktop\Birdsong\1st Dress\M2U00032.MPG"
```
In the `[FORMAT]` section, look for `format_long_name`.


If necessary, concatenate files with:
```shell
C:\Users\Dave>copy /b "C:\Users\Dave\Desktop\Birdsong\1st Dress\M2U00032.MPG" + "C:\Users\Dave\Desktop\Birdsong\1st Dress\M2U00033.MPG" "C:\Users\Dave\Desktop\Birdsong\1st Dress\First Half.MPG"
```
Note the `+` between the files that should be concatenated together - more that two files is possible at once - the last parameter is the output file name.  And note the /b at the beginning - this tells `copy` that its copying binary files, and therefore shouldn't stop when it finds a CTRL-Z character (which `copy` considers an end-of-file character in an ASCII file - [see here](https://technet.microsoft.com/en-gb/library/bb490886.aspx#ECAA))


Finally, convert MPG files to mp4 files with:
```shell
C:\Users\Dave>cd Downloads\ffmpeg-3.4.1-win64-static\bin
C:\Users\Dave\Downloads\ffmpeg-3.4.1-win64-static\bin>ffmpeg.exe -i "C:\Users\Dave\Desktop\Birdsong\1st Dress\First Half.MPG" "C:\Users\Dave\Desktop\Birdsong\1st Dress\First Half.mp4"
```
Note: ffmpeg will guess file types from the extensions, and the default settings for outputting mp4 are: video stream as h264 (High), audio stream as AAC - which generally works well!  Video conversion seems to run at about 3x speed on my work desktop.
