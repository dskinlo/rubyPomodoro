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
	if value.is_number?
		puts value + " minutes"
		timeInMinutes = value
		timeInSeconds = value.to_i * 60
	elsif value.is_string? 
		task << value + " "
	end


end


outputTitle =  "Time |".yellow + "Task:".yellow

while timeInSeconds > 0 
	sleep 1
	timeInSeconds -= 1

	outputResult = readableTime(timeInSeconds) + "| "+ task 
	puts outputTitle + "\r" + outputResult + "\r"


end




#ding




