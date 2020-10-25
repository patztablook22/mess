module Mess
  class Plot

    Name = "Plot template"
    @descX
    @descY
    @data
    @cols

    def initialize chat = nil
      @descX = ""
      @descY = []
      @data = {}
      @cols = 0
    end

    def push msg
    end

    def post
      @data = @data.sort
    end

    def pull
      @data.shift
    end

    def rows
      @data.length
    end

    def cols
      @cols
    end

    def head lvl
      case lvl
      when 0; self.class::Name
      when 1; [@descX, @descY]
      end
    end

  end
end
