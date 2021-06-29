# Trabajando a través del Atlántico: Una Mesa Redonda de Madrid.rb

A Madrid.rb Session with

- Raul Murciano, desarrollador y manager en Heroku
- Jorge Manrubia, programmer en Basecamp
- Juan Salvador Pérez García, full stack developer en Getro

Hosted by Josep Egea

## Online setup

This was an online meetup.

It was organized using OBS streaming to Twitch.

During the session, the participants were connected through
Google Meet.

At the end of the presentation, the address for the Google Meet room
was shared in the Twitch chat for other participants to join in the
Q&A session.

This is the detailed setup:

- Host
  - OBS, streaming to Madridrb's Twitch channel
  - OBS was capturing one of the speaker's computer's screens as a
    whole, showing Google Meet, and with some cropping to hide the
    address bar and the controls.
  - Saving the OBS output locally.
  - Twitch wasn't saving the results, as we don't like to keep the raw
    session there.
  - Google Meet was also saving the meeting, just in case.

## Raw assets

There are 2 main asset files

- `obs_stream.mkv` - OBS stream, saved locally - 1920x1080 48KHz
- `google_meet_recording.mp4` - Recording of the session by Google Meet - 1280x720 32KHz

## Editing notes

- We're going to use mainly the OBS stream.

- This time, OBS got all the audio mostly right, but, still, the audio
  from Google Meet is better, as it has less ambient noise and the
  participants are better equalized, so we're going to use it for
  dubbing.
  
- For the OBS stream:

  - Useful footage starts at 11:01
  
  - Finishes at 1:52:44
  
  - At 1:22:13 finishes the proper Q&A before the first intervention
    by external audience.
    
  - 1:24:51 next question starts.
  - 1:31:40 finished Raul's answer
  
  - 1:33:16 next question starts
  - 1:37:31 end of answers
  
  - 1:41:58 the good bye starts

  - Tentative sync point between sources:
    - OBS: 11:52
    - Google Meet: 25:27.75

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

- **video**: Main element. Subdivided in a sub Makefile
  - **talk** For the talk itself
  - **qa** For the Q&A
  
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

## Additional notes

For this video we had some changes in the general setup, too

- Changed the sponsors' assets for 2021
- Added some utility Ruby code in `lib` that helps in generating
  complex filter descriptions
- Used these filters in this video
