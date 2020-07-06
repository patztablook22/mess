class Chat

  @hash
  @path

  def initialize( path, peek = false )
  
    unless File.file?(path + "/message_1.json")
      return
    end

    total = Dir[path + "/*"].length

    for i in 1..total

      if peek and i > 1
        break
      end

      file = path + "/message_" + i.to_s + ".json"
      raw = ""

      begin

        raw = File.read(file)

        if i == 1 
          @hash = JSON.parse(raw)
        else
          @hash["messages"] += JSON.parse(raw)["messages"]
        end

      rescue

        puts "unable to parse JSON file"
        exit 1

      end

      @path = path
      
    end

  end

  def valid?
    @hash
  end

  def path
    @path
  end

  def title
    @hash["title"]
  end

  def usrs
    usrs = []
    @hash["participants"].each do |p|
      usrs += [ p["name"] ]
    end
    usrs
  end

  def msgs
    @hash["messages"].each do |msg|
      yield msg
    end
  end

  def size
    @hash["messages"].length
  end

end
