# Webpack en Rails sin rails/webpacker y Tooling en Jobandtalent

A Madrid.rb Session by Germán DZ

## Raw assets

You'll need 2 main asset files

- `2018-10-WebpackEnRails-camera.mov`. Single file from the camcorder.
- ` madridrb_oct_2018.mov` screen capture of the speaker's session

## Editing notes

- Camera res: 1920x1080
- Slides res: 1728x1080

- The useful footage on camera starts at 00:28 ends at 46:04. So,
  total length is 45:36 (2736 s)
  
- There's no Q&A, so we can keep the overlay on the whole time.

- Index slide triggers at 1:21 of raw camera footage. 1:07 of screen
  footage.
  
- So, useful screen footage should start at 1:07 - 1:21 + 00:28 = 0:14

- The camera footage is too dark, as the camera is, most of the time,
  underexposing to make up for the super bright projected image. So we
  have cropped the image out and added a "curves=lighter" filter from
  ffmpeg making it a little more decent.

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
