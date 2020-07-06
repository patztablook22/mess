class Stat

  @chat
  @plot
  @@index = {}

  def initialize (chat)
    @chat = chat
    @plot = []
  end

  def self.index (verbose = true)
    
    if verbose
      puts "\nplot index:"
    end

    i = ?a
    ObjectSpace.each_object(Class).select do |cl|

     unless cl < Plot
       next
     end

     @@index[i] = cl
     if verbose
       puts tab(i, 3, true) + " | #{ cl::Name}"
     end

     i = (i.ord + 1 ).chr

     if i == ?{
       i = ?A
     elsif i == ?[
       puts "WARN: suffering from success... too many plot options"
       break
     end

    end

    if verbose; puts; end

  end

  def select (index)

    index.each_char do |i|
      unless @@index.include? i
        puts "invalid plot"
        exit 1
      end
      if @plot.include? i
        next
      end
      @plot += [ @@index[i].new(@chat) ]
    end

  end

  def run

    @chat.msgs do |msg|

      @plot.each do |plot|
        plot.push msg
      end

    end

  end

  def row (r)

    buf = ""

    @plot.each do |plot|

      c = 0
      if r < 2
        p = plot.head(r)
      else
        p = plot.pull
        if p.nil? 
          return nil
        end
      end

      unless p.class == Array
        p = [p]
      end

      p.each do |pp|
        
        unless pp.class == Array
          pp = [pp]
        end

        pp.each do |cell|
          buf += cell.to_s + "\t"
          c += 1
        end

      end

    end

    buf

  end

end
