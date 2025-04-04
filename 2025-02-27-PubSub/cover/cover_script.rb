require_relative '../../lib/ffmpeg_utils'

res = <<-FFMPEG
[0] drawtext=textfile=cover_text.txt:fontcolor=white:fontsize=48:x=w/2-text_w/2:y=h/2-text_h:fontfile=#{default_font},
drawtext=textfile=date_text.txt:fontcolor=white:fontsize=24:x=w/2-text_w/2:y=h/2+text_h:fontfile=#{default_font},
drawtext=textfile=contact_text.txt:fontcolor=0x888888:fontsize=16:x=w/2-text_w/2:y=h/2+400:fontfile=#{default_font} [text];
[2]scale=w=120:h=-1 [logo];
[text][logo] overlay=main_w/2-overlay_w/2:main_h/2-overlay_h-100 [video];
[video][1:a] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
