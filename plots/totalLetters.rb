class TotalLetters < Plot

  Name = "total letters"

  def initialize chat
    super chat
    @descX = "user"
    @descY = "letters"
    @cols  = 2
  end

  def push msg
    nick = msg["sender_name"]
    letters = msg["content"].to_s.length
    @data[nick] = @data[nick].to_i + letters
  end

end
