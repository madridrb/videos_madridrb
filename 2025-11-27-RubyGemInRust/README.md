# Creating a Ruby gem with a Rust native extension

A Madrid.rb session, by Guilherme Carreiro

## General setup

This was an onsite meetup.

It was organized at Lingokids new headquarters.

We recorded the session with a video camera, and, also, captured
everything through 2 HDMI to USB video capture modules, connected to
OBS in a linux laptop, recording the program output (with a
composition of the inputs plus some added text and effects) while also
streaming it through Twitch in real time.

This time everything went well:

- The streaming sounded fine
- The OBS recording was fine in sound and image, too
- The camera recorded image and sound OK, too

So we'll be basically using the OBS output and concatenate it with the
cover and end sections.

There was a small hiccup, though: When Josep was making the
introduction he didn't turn the microphone on, so his audio is very
bad on the main stream. We have it in a better shape in the camera
recording, but, given it's mostly the same old introduction, we'll
just cut it out and start the video with the presentation by Guilherme.

## Raw assets

You'll need these asset files

- 2025-11-27-RubyGemInRust.mkv - OBS recording
  - Video: 1920x1080 - 60 fps
  - Audio: 48 KHz - mono - 32 bps

- Camera recording (pending)
  
## Editing notes

- OBS recording:
  - Total duration: 55:32
  - Start: 04:51
  - End: 55:21
  - Total duration: 50:30

## Building the video

### First run

- Create an `input` folder inside this one and put the source file there.
- Create an `output` folder inside this one.
- run `make` inside this folder.

This should generate all the intermediate parts and the final file.

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
