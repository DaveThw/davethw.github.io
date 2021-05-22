---
title: "Video conversion using ffmpeg on Windows"
categories: Theatre-Royal
tags: ffmpeg
excerpt: Step-by-step through using ffmpeg to convert video files (from our video camera) to mp4's
date: 2018-02-01 11:00
modified:
 - 2018-02-20 12:00
 - 2021-05-22 20:25
last_modified_at: 2021-05-22 20:25
toc: true
toc_sticky: true
---

Our video camera records as MPEG-2 Program Stream files, which are a little bulky and are capped at just under 2GB (about 49mins long) - longer recordings are therefore split into multiple files.  Fortunately, according to the [ffmpeg faq](http://www.ffmpeg.org/faq.html#Concatenating-using-the-concat-protocol-_0028file-level_0029), MPEG-2 PS files can just be concatenated together using the humble `copy` command!..


On the other hand, the DSLR records as QuickTime .mov files, which are capped at 30mins (about 2.5GB) - longer recordings again get split into multiple files, but I don't think the files can just be concatenated together - however `ffmpeg` can do it for us with the [`concat` filter](http://www.ffmpeg.org/ffmpeg-filters.html#concat)...


## Download ffmpeg

First, if not yet done, download ffmpeg from one of the sites listed on the [ffmpeg downloads page](https://www.ffmpeg.org/download.html#build-windows):
 - ~~[zeranoe.com](https://ffmpeg.zeranoe.com/builds/) - I went for the latest Release Build (3.4.1), Windows 64-bit, Static.~~
 - [gyan.dev](https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-github) - I downloaded the `...essentials_build.zip` version
 - [BtbN](https://github.com/BtbN/FFmpeg-Builds/releases)

Once the zip files has downloaded, extract the contents somewhere (Downloads folder works) - note the zip folder contains a directory, which contains everything else, so it's less confusing if you extract directly into Downloads, rather than the subdirectory that the extractor will suggest!..


## Format Check

If you want to, confirm the format that a file is with:
```terminal
C:\Users\Dave>cd Downloads\ffmpeg-*\bin
C:\....\bin>ffprobe -hide_banner -show_format "C:\Users\Dave\Desktop\Birdsong\1st Dress\M2U00032.MPG"
```
In the `[FORMAT]` section, look for `format_long_name` - MPEG-PS files can be concatenated with `copy`, QuickTime / MOV (and other format) files can be concatenated with the `concat` filter.


Note: complete filenames can be easily inserted into the Command Prompt by dragging the file from a Directory window and dropping on the Command window!..


## Concatenate Files

If necessary, concatenate files with (file paths abbreviated for clarity!):
```terminal
C:\Users\Dave>copy /b "....\M2U00032.MPG" + "....\M2U00033.MPG" "....\First Half.MPG"
```
Note the `+` between the files that should be concatenated together - more that two files is possible at once - the last parameter is the output file name.  And note the /b at the beginning - this tells `copy` that its copying binary files, and therefore shouldn't stop when it finds a CTRL-Z character (which `copy` considers an end-of-file character in an ASCII file - [see here](https://technet.microsoft.com/en-gb/library/bb490886.aspx#ECAA))


Note: complete filenames can be easily inserted into the Command Prompt by dragging the file from a Directory window and dropping on the Command window!..


## Basic Conversion

Finally, convert MPG files to mp4 files with:
```terminal
C:\Users\Dave>cd Downloads\ffmpeg-*\bin
C:\....\bin>ffmpeg.exe -hide_banner -i "....\First Half.MPG" "....\First Half.mp4"
```
Note: ffmpeg will guess file types from the extensions, and the [default settings for outputting mp4](http://www.bugcodemaster.com/article/convert-videos-mp4-format-using-ffmpeg) are: video stream as h264 (High), audio stream as AAC - which generally works well!  Video conversion seems to run at about 3x speed on my work desktop.


## De-Interlacing

If it looks like the videos might need de-interlacing (our camera does!), try this instead (found in the [ffmpeg FAQ, here](http://www.ffmpeg.org/faq.html#Interlaced-video-looks-very-bad-when-encoded-with-ffmpeg_002c-what-is-wrong_003f)) - note the additional flags between the input and output file names:
```terminal
C:\Users\Dave>cd Downloads\ffmpeg-*\bin
C:\....\bin>ffmpeg.exe -hide_banner -i "....\First Half.MPG" -flags +ilme+ildct "....\First Half.mp4"
```


## Trimming

You can set a start time and a duration with the `-ss` and `-t` flags, before the `-i` input file, like so:
```terminal
C:\Users\Dave>cd Downloads\ffmpeg-*\bin
C:\....\bin>ffmpeg.exe -hide_banner -ss 0:01:00 -t 1:06:00 -i "....\First Half.MPG" -flags +ilme+ildct "....\First Night - First Half.mp4"
```


## Concat Filter

If the files arean't MPEG-PS, you can use a filter in ffmpeg to concanenate the video streams together - might cause a slight jump if the files don't link up perfectly.
```terminal
C:\Users\Dave>cd Downloads\ffmpeg-*\bin
C:\....\bin>ffmpeg -hide_banner -i "....\DSC_0001.MOV" -i "....\DSC_0002.MOV" -filter_complex concat=n=2:v=1:a=1 "....\First Half.mp4"
```
Only runs at about 0.7x speed on my work desktop.  The above works for two input files into one output file - I think if you want three inputs you just add another `-i "....\xxxxx.MOV"` input, and change the filter settings to `concat=n=3:v=1:a=1`...


## Multiple Conversions

The command prompt will let you run multiple commands on one line using `&` to link them together (or `&&` if you only want to do the second command if the first one exits sucessfully) - [see here](https://stackoverflow.com/questions/8055371/how-do-i-run-two-commands-in-one-line-in-windows-cmd#answer-8055390) - like this: 
```terminal
C:\Users\Dave>cd Downloads\ffmpeg-*\bin
C:\....\bin>ffmpeg.exe -hide_banner -ss 0:01:00 -t 1:06:00 -i "...\First Half.MPG" -flags +ilme+ildct "....\First Night - First Half.mp4" & ffmpeg.exe -hide_banner -ss 1:27:00 -t 0:48:00 -i "....\Second Half.MPG" -flags +ilme+ildct "....\First Night - Second Half.mp4"
```
