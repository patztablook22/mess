class TotalDelay < Plot

  Name = "total delay"
  @times
  @last

  def initialize chat
    super
    @cols = 2
    @descX = "user"
    @descY = "delay [ms]"
    @times = {}
  end

  def push msg

    nick = msg["sender_name"]
    time = msg["timestamp_ms"]

    if @times[nick].to_i < time
      @times[nick] = time
    end

    if @last.nil?
      @last = nick
      return
    elsif @last == nick
      return
    end

    @data[nick] = @data[nick].to_i + time - @times[@last]

    @last = nick

  end

end
