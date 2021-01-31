# frozen_string_literal: true

module Mess
  class WordFrequency < Plotter

    describe 'most frequent words by user'

    def initialize chat
      super
      @data = Hash.new
      chat.usrs.each do |u|
        @data[u] = Hash.new
      end
    end

    private

    def generate_plot
      p = Plot.new
      p.head << 'Index'
      @data.each_key do |usr|
        p.head += ["Word - #{usr}", "Frequency - #{usr}"]
      end
      i = 0
      loop do
        line = [i + 1]
        @data.each_value do |data|
          buff = Array.new(2)
          word = data.to_a[i]
          buff = word unless word.nil?
          line += buff
        end
        break if line.compact.size == 1
        p.data << line
        i += 1
      end
      p
    end

    def push msg
      return if msg.body.nil?
      words = msg.body.split(/[ \t\n]/)
      words.each do |w|
        next if w.strip.empty?
        w = w.downcase
        @data[msg.from][w] = @data[msg.from][w].to_i + 1
      end
    end

    def finalize
      @data.each_key do |usr|
        @data[usr] = @data[usr].sort_by { |key, value| -value }
      end
    end

  end
end
