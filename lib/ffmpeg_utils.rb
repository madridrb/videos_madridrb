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
