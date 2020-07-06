class Dump

  @fd

  def initialize( path )

    begin

      @fd = File.new(path, 'w')
      unless @fd
        throw
      end

    rescue

      puts "unable to open outfile"
      exit 1

    end

  end

  def write stat

    print "dumping... "

    r = 0
    while row = stat.row(r)
      
      row.each do |plot|

        plot.each do |cell|
          @fd.write(cell + $options[:separator].to_s)
        end

        @fd.write($options[:margin].to_s)

      end

      @fd.write("\n")
      r += 1

    end

    puts "done"

  end

end
