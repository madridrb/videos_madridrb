# Docker & Rails: Where to begin

A Madrid.rb Session by Alfonso Alba

## Online setup

This was an online meetup.

It was organized using Jitsi.org to connect the host and the speaker
and then streamed using YouTube Live.

## Raw assets

You'll need just one asset file

- `Madrid.rb_Abril_2020.mp4`. Single file with the YouTube stream

## Editing notes

- Stream res: 1280x720

- Total duration is 1:13:34

- There's some "checking, checking..." footage at the start of the
  stream, so it makes sense to start at 0:13.5
  
- So stream duration will be 1:13:20.5 (4400.5 s)

- There's no need to trim anything from the end.

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
