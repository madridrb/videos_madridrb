# Gemología Popular - Septiembre 2018

A Madrid.rb Session by Enrique García Cota

## Raw assets

You'll need 2 main asset files

- `popular-gemology-27-9-2018-011.mov`. Single file from the camcorder.
- `madrid.rbmio.mov` screen capture of the speaker's session

## Editing notes

- Camera res: 1920x1080
- Slides res: 1920x1080

- The useful footage on camera starts at 6:23 ends at 1:14:09. So,
  total length is 1:07:46 (4066 s)
  
- The presentation ends at 53:44 of the raw footage, so, beyond that
  point, we should remove the overlay. That's 53:44 - 6:23 = 47:21 =
  2841 s.

- Index slide triggers at 6:29 of raw camera footage. 1:48 of screen
  footage.
  
- So, useful screen footage should start at 1:42.

## Building the video

### First run

- Create an `input` folder inside this one and put this 3 files there.
- Create an `output` folder inside this one.
- run `make` inside this folder.

The generation takes around 1/2 hour in a MacBook Pro, but your times
can vary with the load of the machine, the kind of HD/SSD you use, and
more. So, be patient.

### Additional runs

If you want to change any param, just edit the file in question and
run `make` again. That will rebuild the affected parts and generate a
new version of the full video.

## Organization

The `Makefile` is built into basic steps

- **video**: Composes a portion of the camera capture (centered around
  the speaker) with the screencast with the slides on top.
  
- **cover**: Generates the video cover.

- **title**: Same with the title.

- **sponsors**: Same with the sponsors.

- **full_video**: Composes the parts built above into the final video.

There is a folder for each of these steps. In general, in this folders
you'll find:

- A shell script with the `ffmmpeg` invocation (like `gen_video.sh`)

- If that pass uses an ffmpeg complex filter, it will be written in an
  individual text file (like `video_script`.
  
- If that pass also has text to render (like titles, etc), it's
  normally stored in additional individual files, like
  `bottom_text.txt`.
