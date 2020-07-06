class Plot

  @name
  @ysNo
  @legendX
  @legendYs
  @data

  def initialize (name, ysNo, legendX = "X", legendYs = "Y")

    @name     = name
    @ysNo     = ysNo
    @legendX  = legendX
    @legendYs = legendYs
    @data     = {}

  end

  def set (x, ys)

    if ys.class != Array
      ys = [ys]
    end

    @data[x] = ys

  end

  def get (x)
    return @data[x]
  end

  def to_s
    str = ""
    @data.each do |x, ys|
      str += "#{x}\t#{ys[0]}\n"
    end
    return str
  end

end
