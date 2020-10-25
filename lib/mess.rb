# frozen_string_literal: true

require 'json'
require_relative 'mess/version'

module Mess

  class Error < StandardError; end
  # Your code goes here...
=begin  
  autoload :Error, 'mess/error'
  autoload :Chat, 'mess/chat'
  autoload :Tree, 'mess/tree'
  autoload :Plot, 'mess/plot'
=end
end

require_relative 'mess/error'
require_relative 'mess/plot'
Dir["#{__dir__}/mess/**/*.rb"].each { |f| require_relative f }
