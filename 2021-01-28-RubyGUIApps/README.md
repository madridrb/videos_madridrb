# Ruby GUI Apps: Beautiful inside AND outside

A Madrid.rb Session by Josep Egea

## Online setup

This was an online meetup.

It was organized using OBS streaming to Twitch.

During the session, the speaker and and friendly assistant were also
connected through Google Meet, for coordination.

At the end of the presentation, the address for the Google Meet room
was shared in the Twitch chat for participants to join in the Q&A
session.

This is the detailed setup:

- Host
  - OBS, streaming to Madridrb's Twitch channel
  - OBS was capturing one of the speaker's computer's screens as a
    whole. That way he could jump from the presentation, code windows,
    results, etc without needing a change in OBS.
  - For the last part, Google Meet was moved to that screen and
    maximized, so, again, OBS was just streaming the same screen.
  - During the presentation, OBS was broadcasting the speakers webcam
    in a small embed. For the last part, that was removed, as everyone
    was in the Google Meet window.
  - Saving the OBS output locally.
  - Twitch wasn't saving the results, as we don't like to keep the raw
    session there.
  - Google Meet was also saving the meeting, just in case.

## Raw assets

There are 3 main asset files

- `obs_stream.mkv` - OBS stream, saved locally - 1920x1080 48KHz
- `google_meet_recording.mp4` - Recording of the session by Google Meet - 1280x720 32KHz

## Editing notes

- We're going to use mainly the OBS stream.

- It seems that the audio for participants in the Q&A is not good in
  that stream, so we might have to use the Google Meet recording for
  that.
  
- However, the Q&A session wasn't much of that, instead being an
  interchange of greetings. Most likely we're not going to include
  most of that in the final result.
  
- For the OBS stream:

  - Introduction to Madrid.rb starts at 03:21 (201 s).
  
  - Actual presentation starts at 07:50 (470 s).
  
  - At 1:08:03 there's an error. The presenter says "Matomo" when it
    should be "Nanoc".
    
  - The presentation itself ends around 1:22:44. Total duration 4494s.
  
  - First question at about 1:27:00. Ends around 1:31:14
  
  - "I took some notes" starts at 1:36:24 and ends at 1:36:35

  - Tentative sync point between sources:
    - OBS: 1:25:54
    - Google Meet: 1:32:29

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
