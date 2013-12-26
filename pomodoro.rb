#!/usr/bin/env ruby

require 'magic.rb'

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


puts "Pomodoro for: " + timeInMinutes.to_s.yellow + " minutes, doing: " + task.yellow

#ding




