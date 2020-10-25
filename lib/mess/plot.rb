module Mess
  class Plot

    @@available = Hash.new

    def self.available
      @@available
    end

    def self.describe desc
      @@available[name] = desc
    end

    def self.name
      self.to_s.match(/Mess::(?<name>\w+)$/)[:name]
    end

    attr_reader :data

    def initialize chat
    end

    def push msg
    end

    def review
    end

  end
end
