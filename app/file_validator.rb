# frozen_string_literal: true

# Validates the input file and provides message when it's missing.
# I refrained from using some custom error class as I think
# we should only raise errors when something unexpected happens.
# Not giving, or giving wrong input is anything but unexpected.
class FileValidator
  MISSING_FILE_PATH_MESSAGE = 'No file has been given.'
  MISSING_FILE_MESSAGE = 'The file is not found.'

  attr_reader :file_path, :error_message
  private :file_path, :error_message

  def initialize(file_path)
    @file_path = file_path
  end

  def validate
    if file_path.nil?
      @error_message = MISSING_FILE_PATH_MESSAGE

    elsif !File.exist?(File.expand_path(file_path))
      @error_message = MISSING_FILE_MESSAGE
    end

    error_message
  end
end
