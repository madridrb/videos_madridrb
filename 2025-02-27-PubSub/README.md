# How to Build a Boring(TM) Pub-Sub System

A Madrid.rb session, by Christos Zisopoulos

## General setup

This was an onsite meetup.

It was organized at Lingokids.

We recorded the session with a video camera, captured the speaker
screen with QuickTime and, also, captured everything through 2 HDMI to
USB video capture modules, connected to OBS in a linux laptop,
recording the program output (with a composition of the inputs plus
some added text and effects) while also streaming it through Twitch in
real time.

Unfortunately, there were several issues that made the experience less
than perfect:

- The audio output from OBS (both to Twitch and to the recording) is
  spotty and barely usable. A combination of a headset too close to
  the speaker's mouth and some encoding glitch.
  
- The HDMI output of the video camera that was being captured by OBS
  included square markers following the speaker's face, when
  recognized. So that glitch is in the recording and was also
  streamed.
  
Luckily, the sound recorded by the camera, while not perfect, is
usable. Additionally, the image recorded in the camera card didn't
include the face marker, so that's usable, too.

So, the general strategy to produce a better video will be:

- Use the OBS recording as a starting canvas. That saves us from
  having to add the credits, sponsors and everything.
  
- Replace the audio in that video with the audio from the camera
  stream.
  
- Pick the video from the camera stream and overlay it on top of the
  original camera capture, so we get rid of the face marker.



## Raw assets

You'll need these asset files

- OBS-2025-02-27-PubSub.mkv - OBS recording
  - Video: 1080x720 - 60 fps
  - Audio: 44.1 KHz - 32 bps (unusable)

- ScreenRecording-2025-02-27-PubSub.mov - QuickTime capture of speaker's screen
  - Video: 1920x1200 - 60 FPS

- Camera-00008.MTS + Camera-00009.MTS - Camera recording (in 2 segments)
  - Video: 1920x1080 - 25fps
  - Audio: 48 KHz - 32 bps
  
## Editing notes

- OBS recording:
  - Total duration: 39:15
  - Start: 00:55
  - End: 38:56
  - Total duration: 38:01

- Camera recording:
  - Total duration: 44:11 + 8:36 = 52:47
  - Start: 10:23
  - End: 44:11 + 4:13 = 48:24
  - Total duration: 38:01

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
