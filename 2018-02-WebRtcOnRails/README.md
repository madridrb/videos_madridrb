# WebRTC on Rails - Febrero 2018

A Madrid.rb Session by Alejandro González @agonzaleznu

## Raw assets

You'll need 2 main asset files

- `webrtc_camera.mov`. Single file from the camcorder.
- `webrtc_slides.mov` screen capture of the speaker's session

## Editing notes

- Camera res: 1280x720
- Slides res: 1243x777
- When presenting, the slides have really ugly black vertical stripes,
  left and right. When showing code or other apps, the stripes are not
  there. So we cannot overlap the slides over the speaker because most
  of the time the black content would be showing over the speaker
  footage. Therefore, we tile them next to each other, the closer the
  better.

- On the camera, usable stuff starts at 10:19
- Both streams are in synchro at about 11:05 (camera) and 4:16 (slides)
- So, the slides should start at
     4:16 - (11:05 - 10:19) = 
     4:16 - 0:46 = 
     3:30 
     After some fine tuning, we settle in 3:32

- The camera video lasts for 54:09. If we start at 10:19, the real
  length is 43:50. The last 3 seconds of the camera are not good, so
  we have a final duration of 43:47.

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
