# De Programador a Recruiter: por qué pasarse al lado oscuro

Una sesión de Madrid.rb por Raúl Cotrina y Leo Poza

## General setup

This was an onsite meetup.

It was organized at SNGULAR HUB studios and they took care of
recording, producing and even broadcasting to Twitch.



## Raw assets

You'll need just one asset file

- `2022-03-31-MadridRB-DeProgramadorARecruiter.mp4`. Single file with the whole video.

## Editing notes

- Stream res: 1920x1080

- Audio: AAC 48Khz 32 bps

- Total duration is 1:04:24

- Starting point should be at 06:17 

- End should be at 1:04:04
  
- So stream duration will be 57:47

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
