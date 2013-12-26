

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
	system("afplay sounds/ding.wav")
end

def readableTime(timeInSeconds)
  lSeconds = timeInSeconds % 60
  lMinutes = (timeInSeconds / 60).floor

  return lMinutes.to_s.rjust(2, '0') + ":" + lSeconds.to_s.rjust(2, '0')


end

def pomodoro(timeInSeconds, task)
  puts "Task: ".yellow + task.red + " Total Time: ".yellow + readableTime(timeInSeconds).red
  progressbar = ProgressBar.create(:title=>task, :format =>"\e[33m%a\e[0m |%B|", :total => timeInSeconds)

  while timeInSeconds > 0 
    sleep 1
    timeInSeconds -= 1
    progressbar.increment

  end

  Thread.new{ding}
end

def printSummary(logs)

  titleText = "Start Time | End Time | Task".yellow

  puts ""
  puts titleText
  totalTime = 0

  logs.each do |l|

    stime = l[:startTime].hour.to_s + ":" + l[:startTime].min.to_s
    etime = l[:endTime].hour.to_s + ":" + l[:endTime].min.to_s
    totalTime = l[:timeInSeconds].to_i + totalTime.to_i
    puts stime + "      | ".yellow + etime + "    | ".yellow + l[:task]

  end

  puts " "
  puts "Total Pomodoro Time: ".yellow + readableTime(totalTime)

end

def saveLog(logs)
  filename = Time.now.month.to_s + Time.now.day.to_s + Time.now.year.to_s + ".csv"

  if !File.exists? File.expand_path('~/.pomodoro')
    Dir.mkdir( File.expand_path('~/.pomodoro'))
  end

  if !File.exists? File.expand_path('~/.pomodoro/'+filename)
    #if file doesn't exist create it and put values in

    CSV.open(File.expand_path('~/.pomodoro/'+filename),"wb") do |csv|
      csv << logs[0].keys      
      
      logs.each do |l|
        csv << l.values
      end
    end

  else
    #if file does exist, open it to append the values to it
    CSV.open(File.expand_path('~/.pomodoro/'+filename), "ab") do |csv|
      logs.each do |l|
        csv << l.values
      end

    end

  end

end