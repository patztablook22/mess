# frozen_string_literal: true

require 'set'
require 'json'
require 'date'
require_relative 'mess/version'

module Mess
  class Error < StandardError; end
  # Your code goes here...
end

require_relative 'mess/error'
require_relative 'mess/plot'
Dir["#{__dir__}/mess/**/*.rb"].each { |f| require_relative f }
