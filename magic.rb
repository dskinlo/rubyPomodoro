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

#play the ding

def ding

	exec("afplay sounds/ding.wav")
end

def readableTime(timeInSeconds)
  lSeconds = timeInSeconds % 60
  lMinutes = (timeInSeconds / 60).floor

  return lMinutes.to_s + ":" + lSeconds.to_s


end

