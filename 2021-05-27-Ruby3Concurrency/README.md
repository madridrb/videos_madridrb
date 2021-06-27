# Concurrency in Ruby 3

A Madrid.rb Session by Josep Egea

## Online setup

This was a one man setup, with Josep being both host and presenter.

So there was no need to use Meet during the session itself.

After it ended, some participants joined for a short Q&A using Meet.

It was organized using OBS streaming to Twitch.

This is the detailed setup:

- Host & Presenter
  - OBS, streaming to Madridrb's Twitch channel
  - OBS was capturing one of the host's computer's screens as a
    whole, where he was showing both the slides (Firefox running
    Reveal.js), a Terminal session, Emacs and the results of tests.
  - Saving the OBS output locally.
  - Twitch wasn't saving the results, as we don't like to keep the raw
    session there.

## Raw assets

There is a single source

- `obs_stream.mkv` - OBS stream, saved locally - 1920x1080 48KHz

## Editing notes
  
- For the OBS stream:

  - Introduction to Madrid.rb starts at 00:41

  - Actual presentation starts at about 04:38.5

  - The presentation itself ends around 1:24:57

  - Q&A starts at 1:27:08

  - End of Q&A happens at 1:29:44

  - Good bye starts at 1:31:45

  - Good by end at 1:32:10
        

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
