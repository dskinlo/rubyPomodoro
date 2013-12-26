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

  def fullColumn
    columns = %x(tput cols).to_i
    noOfSpaces = columns - self.length
    str = ""
    
    noOfSpaces.times do
      str << " "
    end

    return self + str
  end

end

#play the ding

def ding

	exec("afplay sounds/ding.wav")
end

def readableTime(timeInSeconds)
  lSeconds = timeInSeconds % 60
  lMinutes = (timeInSeconds / 60).floor

  return lMinutes.to_s.rjust(2, '0') + ":" + lSeconds.to_s.rjust(2, '0')


end

def pomodoro(timeInSeconds, task)
  
  puts "Time |".yellow + "Task:".yellow

  while timeInSeconds > 0 
    sleep 1
    timeInSeconds -= 1

    outputResult = readableTime(timeInSeconds) + "| ".yellow+ task 
    print outputResult + "\r"
    $stdout.flush

  end


  puts "Pomodoro Finished!".fullColumn
  ding

end

