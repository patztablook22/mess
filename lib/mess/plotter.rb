# frozen_string_literal: true

# base class for plotters
# initializer should take in Chat class to be analyzed
#
# method push is feeded all messages chronologically
# after pushing all messages, finalize is called to format data etc.

module Mess
  class Plotter

    # stores all available plotters
    @@available = Hash.new
    
    # lists all available plotters
    def self.available
      @@available
    end

    attr_reader :data

    # needs to be described in order to be "centrally" available
    # adds plotter class to available plotters with custom description
    # name is derived from plotter class name
    def self.describe desc
      name = self.to_s.match(/Mess::(?<name>\w+)$/)[:name]
      @@available[name] = desc
    end

    def initialize chat
      @chat = chat
    end

    # should return Mess::Plot
    def run
      @chat.msgs.each { |msg| push(msg) }
      finalize
      generate_plot
    end

    private

    # called for every message in chronological order
    def push msg
    end

    def finalize
    end

    def generate_plot
      Plot.new
    end

  end
end
