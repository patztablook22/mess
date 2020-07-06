class Plot

   Name = "Plot template"
  @chat
  @desc
  @data
  @cols

  def initialize chat
    @chat = chat
    @desc = []
    @data = {}
    @cols = 0
  end

  def push msg
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

  def head row
    case row
    when 0; Name
    when 1; @desc
    end
  end

end
