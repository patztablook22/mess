class Dump

  @fd

  def initialize (path)

    begin

      @fd = File.new(path, 'r+')
      unless @fd
        throw
      end

    rescue

      puts "unable to open outfile"
      exit 1

    end

  end

  def write stat

    r = 0
    while row = stat.row(r)
      @fd.write(row + "\n")
      r += 1
    end

  end

end
