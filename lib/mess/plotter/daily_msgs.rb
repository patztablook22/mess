# frozen_string_literal: true

module Mess
  class DailyMsgs < Plotter

    describe 'daily messages by user'

    def initialize chat
      super
      @data  = Hash.new
      @usrs  = @chat.usrs
      oldest = get_day(chat.msgs[0])
      latest = get_day(chat.msgs[-1])
      for day in (oldest..latest)
        @data[day.to_s] = Array.new(@usrs.size, 0)
      end
    end

    private

    def generate_plot
      p = Plot.new
      p.head << 'Date'
      p.head += @usrs
      @data.each do |date, msgs|
        p.data << [date] + msgs
      end
      p
    end

    def push msg
      usr = msg.from
      day = get_day(msg).to_s
      @data[day][@usrs.index(usr)] += 1
    end

    def get_day msg
      unix = msg.time / 1000
      Date.parse(Time.at(unix).to_s)
    end

  end
end
