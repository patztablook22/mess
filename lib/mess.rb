# frozen_string_literal: true

require "mess/version"

require 'json'
require 'csv'
require 'date'
require 'iconv'

module Mess
  class Error < StandardError; end
  # Your code goes here...
end

require_relative 'mess/version'
require_relative 'mess/error'
require_relative 'mess/msg'
require_relative 'mess/chat'
require_relative 'mess/plot'
require_relative 'mess/plotter'
require_relative 'mess/facebook_information'

Dir["#{__dir__}/mess/plotter/*.rb"].each { |f| require_relative f }
