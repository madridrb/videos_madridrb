# El Mercado de Trabajo Ruby, visto por un Recruiter

A Madrid.rb Session by Rafael Domenech

## Online setup

This was an online meetup.

It was organized using OBS streaming to Twitch.

During the session, the speaker and the host were connected by Google Meet.

At the end of the presentation, the address for the Google Meet room
was shared in the Twitch chat for participants to join in the Q&A
session.

This is the detailed setup:

- Host
  - OBS, streaming to Madridrb's Twitch channel
  - OBS was capturing one of the host's computer's screens as a
    whole, with a single Google Chrome window with the Google Meet
    session.
  - Saving the OBS output locally.
  - Twitch wasn't saving the results, as we don't like to keep the raw
    session there.

## Raw assets

There is a single source

- `obs_stream.mkv` - OBS stream, saved locally - 1920x1080 48KHz

## Editing notes
  
- For the OBS stream:

  - Introduction to Madrid.rb starts at 01:32 (92 s).
  
  - Actual presentation starts at about 10:37, but we're going to keep
    the introduction in the video, because it has part of the actual
    details that lead to the presentation.
      
  - The presentation itself ends around 45:55
  
  - End of Q&A happens at 1:39:40
  
  - So, total duration, if we're not going to cut anything is
    1:39:40 - 1:32 = 1:38:08 = 5888s
    
  - There are some "hot" sections, though, that we're going to remove
    from the video, as the speaker is not confortable with having them
    published.
    
    - 15:24 -> 15:52 (El mundo de la consultoría es una prostitución)
    - 27:32 -> 31:38 (Excel)
    - Entering the muddy waters of "carrera profesional". So far,
      until 33:31 seems SFW
    - From 33:31 to 34:14, rant about bad CTO's. Better skip
    - Again, until 35:11, good. 
    - 40:41 - 42:31 Explanation about his company wanting to work with both
      good and bad CTO's
    - 53:11 - 55:21 First question about juniors. Maybe we could save
      part of it, but when he rants about CEO's it gets ugly.
    - 55:21 - 58:42 Question about remote positions. Too much
      rant. Remove.
    - 58:42 - 1:03:19 Second part for juniors. Keep
    - 1:03:19 - 1:05:44 Piratismo. Why they don't provide name of
      clients.
    - 1:07:44 - 1:08:08 Last part of the answer about why volume
      instead of success rate. Cut.
    - 1:09:02 - 1:10:00  Still more rant about "carniceros"
    - 1:17:05 - 1:19:31  New rant about bad CTO's
    - 1:22:41 - 1:38:00 Diversity rant.
    - 1:39:38 -> End Cut
    

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
