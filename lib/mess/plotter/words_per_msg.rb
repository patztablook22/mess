# frozen_string_literal: true

module Mess
  class WordsPerMessage < Plotter

    describe 'average words per message by user'

    def initialize chat
      super
      @data  = Hash.new
      @msgs  = Hash.new
      @words = Hash.new
      chat.usrs.each do |u|
        @data[u]  = nil
        @msgs[u]  = 0
        @words[u] = 0
      end
    end

    private

    def generate_plot
      p = Plot.new
      p.head = ['User', 'Words per Message']
      p.data = @data.to_a
      p
    end

    def push msg
      @msgs[msg.from] += 1
      return if msg.body.class != String
      @words[msg.from] += msg.body.strip.squeeze.count("\n\t ")
    end

    def finalize
      @data.each_key do |u|
        @data[u] = @words[u].to_f / @msgs[u]
      end
    end

  end
end
