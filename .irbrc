ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

require 'irb/completion'

require 'irb/ext/save-history'

IRB.conf[:USE_READLINE] = true
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
end
  
# Inline colorized ri (override wirble's)
begin
  require 'rubygems'
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  puts "Error loading Wirble. Run 'sudo gem install wirble' to enable colorized results."
end

begin
  require 'what_methods'
rescue LoadError
  puts "Error loading module what_methods"
end
