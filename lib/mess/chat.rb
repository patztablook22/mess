# frozen_string_literal: true

module Mess
  class Chat

    attr_reader :path, :title, :usrs

    def initialize path
      @path = File.expand_path path

      # make sure path exists
      unless File.exists? @path
        raise ChatInvalidError
      end

      # if file, scope out to the whole chat dir
      if File.file? @path
        @path = File.dirname @path
      end

      @title = nil
      @usrs  = nil
      @msgs  = Array.new

      # exactly one message_1.ext file should exist
      tmp = Dir["#@path/message_1\\.*"]
      raise ChatInvalidError unless tmp.one? 
      tmp = tmp.first

      # also store its extension
      ext = File.extname tmp # ".json" or ".html"...
      ext = ext[1..-1]       #  "json" or  "html"...

      # reference the get_ext function
      get = method("get_#{ext}")

      # chronologically iterate through message_X.ext chat files
      # decrementally for some reason reee
      total = Dir["#@path/message_*\\.#{ext}"].size
      for i in (0...total)
        file = "#@path/message_#{total - i}.#{ext}"
        get.call(file) rescue raise ChatInvalidError
      end

      @title = '*you*' if @title.empty?
      @ready = false

    end

    def count
      @msgs.size
    end

    def prepare
      @msgs.sort! { |a, b| a['timestamp_ms'] <=> b['timestamp_ms'] }
    end

    def msgs
      prepare unless @ready
      @ready = true
      @msgs
    end

    private

    def get_json file
      buffer   = JSON.parse(File.read(file))
      @title ||= buffer['title']
      @usrs  ||= buffer['participants'].map{ |p| p['name'] }.sort
      @msgs   += buffer['messages']
    end

    def get_html file
    end

  end
end
