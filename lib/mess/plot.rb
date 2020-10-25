module Mess
  class Plot

    @@available = Hash.new

    def self.describe desc
      name = self.to_s.match(/Mess::(?<name>\w+)$/)[:name]
      @@available[name] = desc
    end

    def self.available
      @@available
    end

    def initialize
    end

    def push
    end

    def post
    end

    def pull
    end

    def rows
    end

    def cols
    end

  end
end
