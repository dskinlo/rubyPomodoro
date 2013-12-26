#!/usr/bin/env ruby

#extend String
class String
  def is_number?
    true if Float(self) rescue false
  end

  def is_string?
  	true if String(self) rescue false
  end

   # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def pink
    colorize(35)
  end

end

def ding
	exec("afplay sounds/ding.wav")
end


logo = IO.read("logo.txt")

puts logo.red

#      _       __             _ _       
#   __| | ___ / _| __ _ _   _| | |_ ___ 
#  / _` |/ _ \ |_ / _` | | | | | __/ __|
# | (_| |  __/  _| (_| | |_| | | |_\__ \
#  \__,_|\___|_|  \__,_|\__,_|_|\__|___/
#                                       

timeInMinutes = 25
timeInSeconds = 25 * 60
task = ""


ARGV.each do |value|
	if value.is_number?
		puts value + " minutes"
		timeInMinutes = value
		timeInSeconds = value.to_i * 60
	elsif value.is_string? 
		task << value + " "
	end


end


puts timeInSeconds
puts timeInMinutes
puts task
ding




