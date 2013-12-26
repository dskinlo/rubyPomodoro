#!/usr/bin/env ruby


#extend String
class String
  def is_number?
    true if Float(self) rescue false
  end

  def is_string?
  	true if String(self) rescue false
  end

end


logo = IO.read("logo.txt")

puts logo

def ding
	exec("afplay sounds/ding.wav")
end

length = 25
task = "Pomodoro"


puts "I was passed:"

ARGV.each do |value|
	if value.is_number?
		puts value + " minutes"
		length = value.to_i * 60
	elsif value.is_string? 
		puts "Task: " + value
	end


end


puts length
ding




