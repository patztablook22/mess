module Mess
  class TotalDelay < Plot

    describe 'total delay by user'

    def initialize chat
      @last = nil
      @time = Hash.new
      @data = Hash.new
      chat.usrs.each do |u|
        @data[u] = 0
      end
    end

    def push msg

      usr  = msg["sender_name"]
      time = msg["timestamp_ms"]

      if @time[usr].to_i < time
        @time[usr] = time
      end

      if @last.nil? or @last == usr
        @last ||= usr
        return
      end

      @data[usr] += time - @time[@last]
      @last = usr

    end

  end
end
