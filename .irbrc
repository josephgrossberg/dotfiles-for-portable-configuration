ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

require 'rubygems'
#require 'utility_belt'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:USE_READLINE] = true
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb.history")

alias :x :exit
alias :q :exit
alias :quit :exit

def ri arg
  puts `ri #{arg}`
end

def cheat arg
  puts `cheat #{arg}`
end

if ENV['RAILS_ENV']
  def sql(query_string)
    ActiveRecord::Base.connection.select_all(query_string)
  end
  unless Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  end
end

class Object
  def local_methods
    self.methods.sort - self.class.superclass.instance_methods
  end
  
  def list_methods
    inspectee = self.class == Class ? self : self.class
    c_list = (inspectee.methods - Object.methods).sort
    i_list = (inspectee.instance_methods - Object.instance_methods).sort
    a_list = inspectee.class.ancestors
    puts "Class Methods", "-"*13, c_list.inspect, '' unless c_list.empty?
    puts "Instance Methods", "-"*16, i_list.inspect, '' unless i_list.empty?
    puts "Ancestors", "-"*9, a_list.inspect, '' unless a_list.empty?
  end

  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
end
  
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end
