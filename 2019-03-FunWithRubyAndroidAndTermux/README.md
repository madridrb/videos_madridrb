# Fun with Ruby, Android and Termux

A Madrid.rb Session by Josep Egea

## Raw assets

You'll need 2 main asset files

- `fun-ruby-android-termux-speaker.mov`. Single file from the camcorder.
- `MadridRB.mov` screen capture of the speaker's session

## Editing notes

- Camera res: 1920x1080
- Slides res: 1920x1080

- The useful footage on camera starts at 03:26, ends at 1:10:07. So,
  total length is 1:06:41 (4001 s)
  
- There's no Q&A, so we can keep the overlay on the whole time.

- Index slide triggers at 03:51 of raw camera footage. 12:19 of screen
  footage.
  
- So, useful screen footage should start at 12:19 - (03:51 - 03:26) =
  11:54
  
- At 15:10 (910 s) in the finished mounted video the speaker moves
  closer to the computer to be able to type, so we'll move the
  cropping a little to the right to compensate.

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
