# Madrid.rb Videos

Scripts to post-produce videos recorded during Madrid.rb sessions.

## Organization

There is a folder for each session, with all the needed setup inside.

There is also a `shared` folder for common resources, like the group
logo or the slides for the sponsors.

The videos are generated using `ffmpeg`, so you'll need to install
that in your system (for macOS, using brew is highly recommended `brew
install ffmpeg`).

The repo doesn't contain the actual video data. The scripts in each
folder expect to find an `input` dir with the raw video files.

You will also have to create an `output` dir, where the intermediate
files and the final video will be stored.

## Generating

In general, open a shell, `cd` into the folder for a certain session
and run `make`.

See the `README` for each individual session for particular details.

## FFMPEG utilities

Given that generating recipes for complex filters can be complex and
the results can be really difficult to read, we've added some helper
Ruby code in the `lib` folder that makes some things easier, like
operating with times, getting the values from environment vars or
generating banners over the video.

You can see some usage of that in [this
video](2021-01-28-RubyGUIApps/video/talk).

## About

Madrid.rb is a Ruby Users Group in Madrid, Spain. Learn more about us
in https://www.madridrb.com and in Twitter @madridrb.

## Authors

Written by Josep Egea (@josepegea).

Original idea from Manuel González (@mgmerino) in
https://github.com/mgmerino/video-tool

## License

The code in this repo is licensed under a MIT license. The corporate
logos and brands depicted in the image assets belong to their
respective owners.
