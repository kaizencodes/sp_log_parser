#!/usr/local/bin/ruby -w
# frozen_string_literal: true

require_relative 'app/controller'

Controller.new(ARGV[0], ARGV[1]).call
