#!/usr/bin/ruby
# -*- coding: utf-8 -*-
# started from https://gist.github.com/tbeseda/9746123
 
message_file = ARGV[0]
 
def app_is_running?(app_name)
  `ps aux` =~ /#{app_name}/ ? true : false
end
 
while true
  if app_is_running?('Rdio.app')
    artist = `osascript -e 'tell application "Rdio" to get the artist of the current track'`
    track = `osascript -e 'tell application "Rdio" to get the name of the current track'`
 
    File.open(message_file, 'w') do |file|
      file.puts "♫ #{artist.chomp} - #{track.chomp}"
    end
  end
  break
end
