$options = {
    :archive  => ".",
    :output   => "mess.out",
    :index    => nil,
    :proces   => nil,
}

OptionParser.new do |opts|

  opts.on("-h", "--help", "print help") do
    puts opts
    exit
  end

  opts.on("-a", "--archive [DIR]", "archive directory path") do |path|
    $options[:archive] = path
  end

  opts.on("-o", "--output [FILE]", "output file path") do |path|
    $options[:output] = path
  end

  opts.on("-i", "--index [NUM]", "chat index") do |index|
    $options[:index] = index
  end

  opts.on("-p", "--process [OPTS]", "processing option(s)") do |process|
    $options[:process] = process
  end
  
end.parse!
