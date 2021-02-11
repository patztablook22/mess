# frozen_string_literal: true

module Mess
  class TotalMsgs < Plotter

    describe 'total messages by user'

    def initialize chat
      super
      @data = Hash.new
      chat.usrs.each do |u|
        @data[u] = 0
        puts u
      end
    end

    private

    def push msg
      unless @data.include? msg.from
        puts msg.from
      end
      @data[msg.from] += 1
    end

    def generate_plot
      p = Plot.new
      p.head = ['User', 'Total Messages']
      p.data = @data.to_a
      p
    end

  end
end
