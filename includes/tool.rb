def nstr( n, str )

  buf = ""
  
  for i in 1..n
    buf += str
  
  end
  
  buf

end
   

def tab( str, max, right = false )

  str = str.to_s
  buf = ""

  unless right
    buf += str
  end

  buf += nstr(max - str.length, ' ')

  if right
    buf += str
  end

  return buf

end

class Bar

  @@lock = nil
  @lock
  @max
  @iter
  @perc
  @last

    def initialize( max )
    @max = max
    @iter = 0
    @perc = -1
    @last = ""
    return lock?
  end

  def lock?

    if @lock
      return true
    end

    if @@lock
      return false
    else
      @@lock = self
      @lock = true
      return true
    end

  end

  def unlock
    if @lock
      @@lock = nil
    end
  end

  def to_s

    unless lock? and @iter <= @max
      return ""
    end

    @iter += 1

    perc = 100 * @iter / @max
    if @perc < perc or @perc == 0 or @perc == @max
      @perc = perc
    else
      return ""
    end

    str = "#{@perc}%"
    out = nstr(@last.length, "\b") + str

    if @iter == @max
      out = nstr(@last.length, "\b") + "done\n"
      unlock
    end

    @last = str
    out

  end

end
