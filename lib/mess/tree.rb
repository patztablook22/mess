# frozen_string_literal: true

module Mess
  class Tree

    attr_reader :root, :chats

    def initialize path, flags = Hash.new

      # find the root from given path

      path = File.expand_path(path)
      begin 

        unless File.exists? path
          break
        end

        if check(path)
          @root = path
          break
        else
          next
        end 

      end until (path = File.dirname(path)) == "/"

      raise TreeInvalidError if @root.nil?
      
      import flags[:archived]

    end

    def check root
      [
        '/',
        '/inbox',
        '/archived_threads',
      ].all? { |dir| File.directory?(root + dir) }
    end

    private

    def import archived

      @chats = Array.new

      box = Array.new
      box << 'inbox'
      box << 'archived_threads' if archived

      # find all text chat dirs
      box.each do |b|
        Dir["#@root/#{b}/*"].each do |dir|

          # exclude asset dirs (capitalized)
          base = File.basename dir
          next unless base.downcase == base

          # list it
          begin
            @chats << Chat.new(dir)
          rescue
          end

        end
      end

    end

    def select i
      Chat.new(@index[i.to_i].to_s)
    end

  end
end
