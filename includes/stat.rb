class Stat

  @chat
  @plot
  @@index = {}

  def initialize( chat )
    @chat = chat
    @plot = []
  end

  def self.index( verbose = true )
    
    if verbose
      puts "\nplot index:"
    end

    a = "asdfghjklqwertyuiopzxcvbnmASDFGHJKLQWERTYUIOPZXCVBNM"
    i = 0
    ObjectSpace.each_object(Class).select do |cl|

     unless cl < Plot
       next
     end

     @@index[a[i]] = cl
     if verbose
       puts tab(a[i], 3, true) + " | #{ cl::Name}"
     end

     i += 1

     if i > a.length - 1
       puts "WARN: suffering from success... too many plot options"
       break
     end

    end

    if verbose; puts; end

  end

  def select( index )

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

    print "processing... "
    bar = Bar.new(@chat.size)

    @chat.msgs do |msg|

      print bar

      @plot.each do |plot|
        plot.push msg
      end

    end

    print "reviewing... "
    bar = Bar.new(@plot.size)

    @plot.each do |plot|
      print bar
      plot.post
    end

  end

  def row( r )

    row = []
    done = true

    @plot.each do |plot|

      buf = []

      if r < 2
        p = plot.head(r)
        done = false
      else
        p = plot.pull
        unless p.nil?
          done = false
        end
      end

      unless p.class == Array
        p = [p]
      end

      p.each do |axis|
        
        unless axis.class == Array
          axis = [axis]
        end

        axis.each do |cell|
          buf += [cell.to_s]
        end

      end

      for i in 1 .. plot.cols - buf.length
        buf += [""]
      end

      row += [buf]

    end
  
    if done
      return nil
    end

    row

  end

end
