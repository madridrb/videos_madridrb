# Event Madrid.rb <-> Madrid Elixir

A Madrid.rb session, with 2 presentations.

## General setup

This was an onsite meetup.

It was organized at Monday Cibeles (thanks to Lingokids).

### Recording and streaming

We recorded the session with a video camera, captured the speaker
screen with QuickTime and, also, captured everything through 2 HDMI to
USB video capture modules, connected to OBS in a linux laptop,
recording the program output (with a composition of the inputs plus
some added text and effects) while also streaming it through Twitch in
real time.

After the problems we had in the previous self-managed session
(February 2025) we've made some improvements:

- Make sure that the USB capture cards are connected to the best USB
  ports. Specially, the source coming from the camera should be
  connected to the direct USB-A port in the laptop, as it's the best
  connection. The source coming from the speaker laptop can be
  connected through a multi-hub that accepts USB-A inputs and outputs
  through USB-C. (We tested using a lower quality USB-A to USB-C cable
  and the camera source had a very low framerate).
  
- Last time, both the recording and the streaming used 1280x720, which
  wasn't that bad, but broke our habit of using 1920x1080 (and we had
  to adjust the ffmpeg scripts and filters to deal with that). This
  time, we used the OBS Video Settings to set the "Ouput (Scaled)
  Resolution" to 1920x1080. Also, we adjusted the "Base (Canvas)
  Resolution" to 1.5 the previous one (2880x1620) with "Bicubic"
  scaling, which gave us the additional benefit of a simulated
  antialiasing that's specially noticeable in the texts.
  
