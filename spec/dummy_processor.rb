# frozen_string_literal: true

class DummyProcessor
  attr_reader :collection

  def initialize
    @collection = []
  end

  def process(line)
    collection << line
  end
end
