# frozen_string_literal: true

#  Reads the file line by line and returns it in a struct.
#  This class expects the file to exist.
class LogReader
  attr_reader :file_path
  private :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def read_line
    File.foreach(file_path) do |line|
      path, ip = line.split(' ')
      yield ParsedLine.new(path, ip)
    end
  end
end
