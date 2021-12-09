# Useful manipulators for easier ffmpeg configuration

def parse_timestamp(time_str)
  parts = time_str.split(':')
  parts.reverse.each.with_index.reduce(0.0) do |acum, item|
    acum + item[0].to_f * 60 ** item[1]
  end
end

def parse_env_timestamp(var)
  parse_timestamp(ENV[var])
end

def all_videos_root
  File.expand_path(File.join(__FILE__, "../.."))
end

def shared_folder
  File.join(all_videos_root, "shared")
end

def fonts_folder
  File.join(shared_folder, "fonts")
end

def default_font
  File.join(fonts_folder, "arial-black_allfont_net.ttf")
end

def banner(textfile, start_t, end_t, options = {})
  "drawtext=textfile=#{textfile}" +
    ":fontcolor=#{options[:fontcolor] || '0x888888'}" +
    ":box=#{options[:box] || '1'}" +
    ":boxcolor=#{options[:boxcolor] || '0x222222'}" +
    ":fontsize=#{options[:fontsize] || '32'}" +
    ":x=#{options[:x] || 'main_w/2-text_w/2'}" +
    ":y=#{options[:y] || 'h-220'}" +
    ":fontfile=#{options[:fontfile] || '\'' + default_font + '\''}" +
    ":enable='between(t,#{start_t},#{end_t})'" +
    ":alpha='0.9*between(t,#{start_t},#{end_t})*" +
    "if(between(t,#{start_t},#{start_t}+0.5),(t-#{start_t})/0.5,1)*" +
    "if(between(t,#{end_t}-0.5,#{end_t}),(#{end_t}-t)/0.5,1)'"
end

# Encloses 'video_stream' inside a slightly smaller frame inside a 1920x1080 stream
# and puts a small logo and 2 texts below it.

def simple_frame(video_stream, logo_stream, left_textfile, right_textfile, options = {})
  prefix = options[:prefix] || 'simple_frame'
  lines = []
  lines << "color=black:s=1920x1080 [#{prefix}_bg];"
  lines << "[#{logo_stream}]scale=w=-1:h=30 [#{prefix}_logo];"
  lines << "[#{prefix}_bg][#{prefix}_logo] overlay=30:main_h-overlay_h-5 [#{prefix}_bglogo];"
  lines << "[#{video_stream}]scale=w=-1:h=1040 [#{prefix}_stream];"
  lines << "[#{prefix}_bglogo][#{prefix}_stream] overlay=main_w/2-overlay_w/2:0 [#{prefix}_composite];"
  lines << "[#{prefix}_composite] drawtext=textfile=#{left_textfile}:fontcolor=0x888888:fontsize=14:x=80:y=h-25:fontfile=#{default_font} [#{prefix}_composite-text-1];"
  lines << "[#{prefix}_composite-text-1] drawtext=textfile=#{right_textfile}:fontcolor=0x888888:fontsize=14:x=w-text_w-35:y=h-25:fontfile=#{default_font} [#{prefix}_final_frame];"
  lines.join("\n")
end
