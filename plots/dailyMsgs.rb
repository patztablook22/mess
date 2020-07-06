class DailyMsgs < Plot

  Name = "daily messages"
  
  @usrs

  def initialize chat
    super chat
    @usrs = @chat.usrs
    @cols = @usrs.length + 1
  end

  def push msg

    usr  =           msg["sender_name"]
    day   = Time.at( msg["timestamp_ms"] / 1000 ).to_s[0..9]

    unless @data.include? day
      @data[day] = Array.new( @usrs.length, 0 )
    end

    for i in 0 .. @usrs.length - 1
      if @usrs[i] == usr
        @data[day][i] += 1
      end
    end

  end

end
