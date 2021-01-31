module Mess
  class Plot
    attr_accessor :head, :data

    def initialize
      @head = Array.new
      @data = Array.new
    end

    def export_data
      puts @head.join("\t");
      @data.each do |d|
        puts d.join("\t");
      end
    end

  end
end
