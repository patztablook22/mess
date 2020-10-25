# frozen_string_literal: true

module Mess
  class DailyMsgs < Plot

    describe 'daily messages by user'

    def initialize chat
      @data  = Hash.new
      @usrs  = chat.usrs
      oldest = get_day(chat.msgs[0])
      latest = get_day(chat.msgs[-1])
      for day in (oldest..latest)
        @data[day.to_s] = Array.new(@usrs.size, 0)
      end
    end

    def push msg
      usr = msg['sender_name']
      day = get_day(msg).to_s
      @data[day][@usrs.index(usr)] += 1
    end

    private

    def get_day msg
      unix = msg['timestamp_ms'] / 1000
      Date.parse(Time.at(unix).to_s)
    end

  end
end
