# frozen_string_literal: true

require_relative 'json'
require_relative 'mess/version'

module Mess
  class Error < StandardError; end
  # Your code goes here...
  
=begin
  autoload :Chat, 'mess/chat'
  autoload :Tree, 'mess/tree'
  autoload :Plot, 'mess/plot'
=end
end

Dir["#{__dir__}/mess/**/*.rb"].each { |f| require_relative f }
