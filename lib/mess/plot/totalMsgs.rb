module Mess
  class TotalMsgs < Plot

    describe "total messages by user"

    def initialize chat
      super
      @descX = "user"
      @descY = "messages"
      @cols  = 2
    end

    def push msg
      nick = msg["sender_name"]
      @data[nick] = @data[nick].to_i + 1
    end

  end
end
