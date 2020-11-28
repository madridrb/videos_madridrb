# Dockeriza tu Rails

A Madrid.rb Session by Miguel Savignano

## Raw assets

You'll need 2 main asset files

- `dockeriza-tu-rails-speaker.mov`. Single file from the camcorder.
- `MadridRBEnero2019-slides.mov` screen capture of the speaker's session

## Editing notes

- Camera res: 1920x1080
- Slides res: 1920x1080

- The useful footage on camera starts at 09:14 ends at 48:31. So,
  total length is 39:17 (2357 s)
  
- Presentation ends at 39:19 of the raw camera footage, that is 30:05
  (1805 s) from the valid footage. During Q&A the speaker refers to
  slides in these moments:
  - 30:30 (1830) - 31:23 (1883)
  - 33:31 (2011) - 36:10 (2170)
  - 37:27 (2247) - 38:42 (2322)

- Synchro point triggers at 09:55 of raw camera footage, 13:40 of
  screen footage.
  
- So, useful screen footage should start at 13:40 - 9:55 + 9:14 =
  12:59.

- The presenter is on the left side of the camera footage, looking
  right, so we'll have to mirror the usual setup and put the slides on
  the left.
  
- From 0:52 to 1:01 on the output of main video the camera is moved to
  the right, so we'll need to reframe the cropping.

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
