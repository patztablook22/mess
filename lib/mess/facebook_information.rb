# frozen_string_literal: true

module Mess
  class FacebookInformation
    attr_reader :root, :chats

    def initialize path, archived_too = false
      path = File.expand_path(path)

      # find the closest thing to facebook information copy root
      # while gradually ascending
      begin
        break unless File.exists? path
        next  unless is_root? path
        @root = path
      end until (path = File.dirname(path)) == '/'

      raise FacebookInformationInvalidError if @root.nil?

      @chats  = Array.new
      to_list = Array.new
      to_list << "inbox"
      to_list << "archived_threads" if archived_too
      to_list.each do |i|
        list_chats "#@root/#{i}"
      end
      @chats.sort_by!(&:title)
    end

    private

    # checks if given path is a root of a facebook information copy
    def is_root? path
      [
        '/',
        '/inbox',
        '/archived_threads',
      ].all? { |dir| File.directory?(path + dir) }
    end

    def list_chats inbox_dir
      Dir["#{inbox_dir}/*"].each do |chat_dir|
        base = File.basename(chat_dir)
        @chats << Chat.new(chat_dir) rescue nil
      end
    end

  end
end
