ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

require 'rubygems'
require 'awesome_print'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:USE_READLINE] = true
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb.history")

alias :x :exit
alias :q :exit
alias :quit :exit

def ri(arg)
  puts `ri #{arg}`
end

def cheat(arg)
  puts `cheat #{arg}`
end

def sql(arg)
  puts arg.to_sql.pretty_format_sql
end
