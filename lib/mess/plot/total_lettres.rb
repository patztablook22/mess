module Mess
  class TotalLetters < Plot

    describe 'total letters per user'

    def initialize chat
      @data = Hash.new
      chat.usrs.each do |u|
        @data[u] = 0
      end
    end

    def push msg
      usr = msg['sender_name']
      letters = msg['content'].to_s.length
      @data[usr] += letters
    end

  end
end
