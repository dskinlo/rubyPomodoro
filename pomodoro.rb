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
timeInSeconds = timeInMinutes * 60
task = ""



ARGV.each do |value|
	#if there is a number in the ARGV then it sets how many minutes the pomodoro will be
	if value.is_number?
		timeInMinutes = value
		timeInSeconds = 5#value.to_i * 60

	#if there is a string it uses it to build the task name
	elsif value.is_string? 
		task << value + " "
	end


end


pomodoro(timeInSeconds, task)


