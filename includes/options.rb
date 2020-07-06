$options = {
    :facebook   => ".",
    :output     => "mess.txt",
    :separator  => "\t",
    :margin     => "\t",
    :archived   => false,
    :chat       => nil,
    :plot       => nil,
    :list       => false,
}

def parse

  parser = OptionParser.new do |opts|

    opts.on("-h", "--help", "print help") do
      puts opts
      exit
    end

    opts.on("-l", "--list", "list options (with -c/-p)") do
      $options[:list] = true
    end

    opts.on("-f", "--facebook [DIR]", "facebook archive path") do |path|
      if path.nil? or path.empty?
        return
      end
      $options[:facebook] = path
    end

    opts.on("-o", "--output [FILE]", "output file path") do |path|
      if path.nil? or path.empty?
        return
      end
      $options[:output] = path
    end

    opts.on("-s", "--separator [STR]", "output vertical separator") do |str|
      if str.nil? or str.empty?
        return
      end
      $options[:separator] = str
    end

    opts.on("-m", "--margin [STR]", "output plot margin") do |str|
      if str.nil? or str.empty?
        return
      end
      $options[:margin] = str
    end

    opts.on("-c", "--chat [NUM]", "select chat") do |chat|
      if chat.nil? or chat.empty?
        $options[:chat] = true
      else
        $options[:chat] = chat
      end
    end

    opts.on("-p", "--plot [CHR]", "select plot") do |plot|
      if plot.nil? or plot.empty?
        $options[:plot] = true
      else
        $options[:plot] = plot
      end
    end

    opts.on("-r", "--archived", "include archived chats") do
      $options[:archived] = true
    end
    
  end

  begin
    parser.parse!
  rescue
    puts parser.help
    exit 1
  end

end
