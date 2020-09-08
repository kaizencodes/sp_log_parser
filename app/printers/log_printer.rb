# frozen_string_literal: true

# prints to the output path
class LogPrinter
  attr_reader :path
  private :path

  def initialize(path)
    @path = path
  end

  def print(payload)
    File.write(path, payload.to_s + "\n", mode: 'a')
  end
end
