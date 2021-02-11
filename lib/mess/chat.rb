# frozen string_literal: true

# Mess::Chat
# class wrapping a single Messenger conversation (Group/Person)
# initializer takes single conversation directory path as an argument
# (contains text files, attachmed photos and other files etc.)
# chat.title  -> get conversation tytle
# chat.size   -> count messages
# chat.usrs   -> participant list
# chat.msgs   -> all messages

module Mess
  class Chat
    attr_reader :path, :title, :usrs, :msgs
    
    def initialize path
      @path = File.expand_path(path)

      # make sure the path is somewhat valid
      raise ChatInvalidError unless File.exists? @path

      # maybe given a file within the directory instead? -> scope out
      @path = File.dirname(@path) if File.file? @path

      # prepare data buffers
      @title = nil
      @usrs  = nil
      @msgs  = Array.new

      # either .json or .html -> message_1.ext to find out the format
      message_1 = Dir["#@path/message_1\\.*"]
      raise ChatInvalidError unless message_1.one?
      message_1 = message_1.first
      extension = File.extname(message_1)
      extension = extension[1..-1] # remove the dot in .ext

      # reference the get_extension function
      get = method("get_#{extension}")

      # iterate through message_X.ext and use get method to parse the files
      # do it chronologically -> descending X for messenger (reeee)
      total = Dir["#@path/message_*\\.#{extension}"].size
      total.downto(1) do |i|
        file = "#@path/message_#{i}.#{extension}"
        get.call(file) #rescue raise ChatInvalidError
      end

      @title = '*you*' if @title.nil? or @title.empty?
      @msgs.sort_by!(&:time)
      @usrs.sort!
    end

    def size
      @msgs.size
    end

    private

    # parse json file
    def get_json file
      # get data
      buffer = File.read(file)
      buffer = JSON.parse(buffer)

      # get metadata if not already done before (each file contains it)
      @title ||= buffer['title']
      @usrs  ||= buffer['participants'].map{ |p| p['name'] }.sort

      # append messages
      buffer['messages'].each do |hash|
        msg = Msg.new
        msg.from = hash['sender_name']
        msg.body = hash['content']
        msg.time = hash['timestamp_ms']
        msg.type = hash['type']
        @msgs << msg
        @usrs << msg.from unless @usrs.include? msg.from
      end
    end

    # parse html file
    def get_html file
      raise ChatInvalidError
    end
  end
end
