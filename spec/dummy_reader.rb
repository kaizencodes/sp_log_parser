# frozen_string_literal: true

class DummyReader
  attr_reader :content

  def initialize(content)
    @content = content
  end

  def read_line
    content.each { |line| yield line }
  end
end
