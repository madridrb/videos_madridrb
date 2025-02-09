# Data Warehouses with ClickHouse and Ruby

A Madrid.rb session, by Javier Vidal

## General setup

This was an onsite meetup.

It was organized at SNGULAR HUB studios and they took care of
recording, producing and even broadcasting to Twitch.

## Lost footage

Due to a technical problem, the first minutes of the presentation,
along with the introduction weren't recorded nor broadcasted.

The recording starts at slide 14.

We'll generate a composite of the first 13 slides, with a first one
explaining the error and prepend them to the video.

## Raw assets

You'll need these asset files

- `2022-10-04-ClickHouse.mp4`. Single file with the whole video.
- `slides/Slice-XX.png`. The individual missing slides

## Editing notes

- Stream res: 1920x1080

- Audio: AAC 48Khz 32 bps

- Total duration is 51:48

- Starting point should be at 0:00 

- End should be at 51:44
  
- So stream duration will be 51:44

- Even with just one video source, we're still going to use overlays
  to have some branding at the bottom of the stream.

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
