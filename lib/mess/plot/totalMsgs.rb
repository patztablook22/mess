module Mess
  class TotalMsgs < Plot

    describe "total messages by user"

    def initialize chat
      @data = Hash.new
      chat.usrs.each do |u|
        @data[u] = 0
      end
    end

    def push msg
      usr = msg["sender_name"]
      return if usr.empty?
      @data[usr] += 1
    end

  end
end
