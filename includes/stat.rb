class Stat

  @chat

  def initialize (chat)
    @chat = chat
  end

  def totalMsgs
    plot = Plot.new( "total messages", 1 )

    @chat.nicks.each do |nick|
      plot.set(nick, 0)
    end

    @chat.msgs do |msg|
      nick = msg["sender_name"]
      plot.set( nick, plot.get(nick)[0] + 1 )
    end

    return plot

  end

  def dailyMsgs 
    nicks = @chat.nicks
    plot = Plot.new( "daily messages", nicks.length, "day", nicks )

    @chat.msgs do |msg|

      day = Time.at(msg["timestamp_ms"] / 1000).to_s[0..9]
      nick = msg["sender_name"]

      tmp = plot.get(day)

      if tmp == nil
        tmp = Array.new( nicks.length, 0 )
      end

      for i in 0 .. nicks.length - 1
        if nicks[i] == nick
          tmp[i] += 1
        end
      end
      
      plot.set(day, tmp)

    end

    return plot

  end

  def dailyReacts
  end

  def dailyFiles
  end

  def dailyCalls
  end

end
