# La Mina de Ruby: Gemas - Abril 2018

A Madrid.rb Session by Manu Gonzalez

## Raw assets

You'll need 2 main asset files

- `3.5.2018-002.mov`. Single file from the camcorder.
- `madridrb.mov` screen capture of the speaker's session

## Editing notes

- Camera res: 1920x1080
- Slides res: 2560x1440

- The slides occupy just the center quarter of the screen until minute
  20:11. After that, the presentation is magnified to occupy the whole
  screen. Ideally it would be good to magnify the first part during
  the post-processing.

- On the camera, usable stuff starts at 02:11

- Both streams are in synchro at about 18:23 (camera) and 20:12 (slides)
- So, the slides should start at
     20:12 - (18:23 - 02:11) = 
     20:12 - 16:12 = 
     04:00 

- The camera video lasts for 44:38. If we start at 02:11, the real
  length is 42:27. The last 2 seconds of the camera are not good, so
  we have a final duration of 42:25 (2545 seg)
  
- At 41:46 in the mounted video (43:27 in the orig camera file, 41:15
  in the processed video file, without cover, title, etc, i.e. second
  2475 ) the speaker moves far into the right to answer a
  question. The slides are not relevant anymore so we could stop the
  overlaying of the slides and get back to full camera view.

- From 38:58 (2338) to 40:27 (2427) (adjusted camera time), the speaker also moves
  into the right, so it would be good to hide the slides in this
  interval, too.

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
