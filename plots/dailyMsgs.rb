class DailyMsgs < Plot

  Name = "daily messages"
  
  @usrs
  @oldest
  @latest

  def initialize chat
    super chat
    @usrs  = @chat.usrs
    @cols  = @usrs.length + 1
    @descX = "day"
    @descY = @usrs
  end

  def push msg

    usr  =           msg["sender_name"]
    uxt  = msg["timestamp_ms"] / 1000
    day   = Time.at(uxt).to_s[0..9]

    unless @data.include? day
      @data[day] = Array.new( @usrs.length, 0 )
    end

    if @oldest.nil? or uxt < @oldest
      @oldest = uxt
    end

    if @latest.nil? or uxt > @latest
      @latest = uxt
    end

    for i in 0 .. @usrs.length - 1
      if @usrs[i] == usr
        @data[day][i] += 1
      end
    end

  end

  def post

    tmp = @latest
    begin

      day = Time.at(tmp).to_s[0..9]
      
      unless @data.include? day
        @data[day] = Array.new( @usrs.length, 0 )
      end

      tmp -= 86400

    end while tmp > @oldest

  end

end
