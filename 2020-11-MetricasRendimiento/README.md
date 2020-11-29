# Historias cortas sobre Métricas de Rendimiento

A Madrid.rb Session by Rafa de Castro

## Online setup

This was an online meetup.

It was organized using the OBS streaming application and Google Meet
to connect the host and the speaker. The result, was streamed using
Twitch.

Instead of streaming the raw Google Meet results, we included the
Google Meet window as a source for OBS.

This is the detailed setup:

- Host
  - OBS, streaming to Madridrb's Twitch channel
  - Google Meet window embeded as a stream source in OBS, when needed
  - Saving the OBS output locally, too.
  
- Speaker
  - OBS, streaming to his own Twitch channel
  - Also, OBS acting as a virtual camera, to use it in the Google Meet
    connection, so, when appearing in the conf, it was using the full
    OBS output.
  - Saving the OBS output locally, too.
    
Given that the speaker was streaming to its own Twitch channel, when
it was time for the proper session to start the host issued a `/host
rafadecastro` command in the Twitch chat and that transferred the
output for connected viewers to the speaker's stream.

Once the session ended and the Q&A were about to start, the host
issued a `/unhost` command to get the viewers back to his stream.

While the viewers always watched the correct stream (the host or the
speaker, depending on the moment) the Twitch recording for each party
only included its own stream, not the other one.

So we'll have to combine the different sources at the right moments to
get the final, edited video.

## Raw assets

There are 3 main asset files

- `obs_stream_host.mkv` - Host stream, saved locally - 1920x1080 48KHz
- `obs_stream_speaker.mkv` - Speaker stream, saved locally - 1920x1080 48KHz
- `twitch_stream_host.mp4` - Host stream, as saved by Twitch - 1920x1080  48KHz

## Editing notes

- We're going to use only the OBS streams. The Twitch stream is there
  only in case of problems.
  
- For the OBS host stream:
  - Useful footage starts at 06:01 (361 s)
  - Handover after introduction happens at 12:10 (730 s)
  - Resume after handover happens around 1:04:40, but with some
    problems. We should cut at 1:04:53 and resume at 1:08:04
  - The Q&A's goes straight until the end of the stream at 1:21:29
    (4889 s)
    
- For the OBS speaker stream:
  - Footage after the handover happens at 13:11 (791 s).
  - Proper talk ends at 1:03:27 (3791 s)

- Individual parts durations:
  - 12:10 - 06:01 = 06:09 (369 s)
  - 1:03:27 - 13:11 = 50:16 (3016 s)
  - 1:04:53 - 1:04:40 = 00:13 (13 s)
  - 1:21:29 - 1:08:04 = 13:25 (805 s)

- Total duration: 06:09 + 50:16 + 16:49 = 73:14 = 1:13:14 = 4394 s

- Although the 2 streams have the same resolution and sound freq, one
  is 30 fps and the other is 25 fps, so we've had to force them to
  have 25 fps because, if not, when concatenating the video the result
  got out of control.

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
