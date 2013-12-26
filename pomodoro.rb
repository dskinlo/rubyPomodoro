#!/usr/bin/env ruby

require './magic.rb'
require 'ruby-progressbar'
require 'CSV'

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
logging = false
debug = false
continue = true
log = Array.new

ARGV.each do |value|
	#if there is a number in the ARGV then it sets how many minutes the pomodoro will be
	if value.is_number?
		timeInMinutes = value
		timeInSeconds = value.to_i * 60

	#if there is a string it uses it to build the task name
	elsif value.is_string? 
		if value == "--log"
			logging = true
		elsif value == "--debug"
			debug = true

		else
			task << value + " "

		end

	end


end
#debug
if debug == true
	timeInSeconds = 3
end

while continue == true
	

	startTime = Time.new()
	pomodoro(timeInSeconds, task)
	endTime = Time.new()
	thoughts = ""
	if debug == true
		pomodoro(3,"BREAK")
	else
		pomodoro(300, "BREAK")
	end
		
	if logging == true

		print "How did this Pomodoro go? ".yellow
		thoughts = $stdin.gets.chomp()

	end


	log << {:startTime=> startTime, :endTime => endTime, :timeInSeconds => timeInSeconds, :task=> task, :thoughts => thoughts}

	print "\nWould you like to do another Pomodoro (y/n)? ".yellow
	cont = $stdin.getch.chomp()
	
	if cont.upcase() == "N"
		continue = false

		printSummary(log)
		if logging == true
			saveLog(log)
		end

	else
		print "\nNew task (blank to repeat previous task)? ".yellow
		newtask = $stdin.gets.chomp()
		if newtask != ""
			task = newtask
		end
	end
	puts ""

end

