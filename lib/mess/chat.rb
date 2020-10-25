# frozen_string_literal: true

module Mess
  class Chat

    attr_reader :path, :title, :usrs, :msgs

    def initialize path
      @path = path
      if File.file? @path

        buffer = JSON.parse(File.read(@path))
        @title = buffer['title']
        @usrs  = buffer['participants'].map { |p| p['name'] }
        @msgs  = buffer['messages']

      else



      end
    end

    def count
      @msgs.size
    end

  end
end
