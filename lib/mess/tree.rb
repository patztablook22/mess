module Mess
  class Tree

    @root
    @index

    def initialize path

      @index = {}

      path = File.expand_path(path)
      begin 

        unless File.exists? path
          break
        end

        if check (path)
          @root = path + "/"
          return
        else
          next
        end 

      end until (path = File.dirname(path)) == "/"

      puts "messages archive root - archive not valid"
      exit 1

    end

    def check root

      required = [
        root,
        root + "/inbox",
        root + "/archived_threads",
      ]

      required.all? { |dir| File.directory? dir }

    end

    def index archived, verbose = false

      dirs = ["inbox"]
      chats = []

      if archived
        dirs += ["archived_threads"]
      end

      dirs.each do |dir|
        chats += Dir[ @root + dir + "/*" ]
      end

      if verbose
        puts "\nchat index:"
      end

      i = 1
      chats.each do |chat|

        chat = Chat.new(chat, true)
        unless chat.valid?
          next
        end

        if verbose
          title = chat.title
          if title.empty?
            title = "*you*"
          end
          puts tab(i, 3, true) + " | " + title
        end

        @index[i] = chat.path

        i += 1

      end

      if verbose; puts; end

    end

    def select i
      Chat.new(@index[i.to_i].to_s)
    end

  end
end
