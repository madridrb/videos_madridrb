require_relative '../../lib/ffmpeg_utils'

res = <<-FFMPEG
[0] drawtext=textfile=title_text.txt:fontcolor=white:fontsize=32:x=w/2-text_w/2:y=h/2-text_h:fontfile=#{default_font},
drawtext=textfile=speaker_text.txt:fontcolor=white:fontsize=24:x=w/2-text_w/2:y=h/2+text_h:fontfile=#{default_font} [video];
[video][1:a] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
