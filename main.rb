#!/usr/local/bin/ruby
# frozen_string_literal: true

require_relative 'app/controller'

Controller.new(ARGV[0], ARGV[1]).call
