class TotalMsgs < Plot

  Name = "total messages"

  def initialize chat
    super chat
    @desc = ["user", "total"]
    @cols = 2
  end

  def push msg
    nick = msg["sender_name"]
    @data[nick] = @data[nick].to_i + 1
  end

end
