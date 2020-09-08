# frozen_string_literal: true

require_relative 'initializer'

# main class that contains the high level logic.
class Controller
  attr_reader :input_path, :output_path
  private :input_path, :output_path

  def initialize(input_path, output_path)
    @input_path = input_path
    @output_path = output_path
  end

  def call
    errors = FileValidator.new(input_path).validate
    if errors
      StandardPrinter.new.print(errors)
      return
    end

    # here we could add a factory if there are more types of input
    # since we only read from log, there is no need.
    reader = LogReader.new(input_path)
    pages = PageProcessor.new(reader).process

    most_visits = MostVisitsPresenter.new(pages: pages)
    unique_visits = MostUniqueVisitsPresenter.new(pages: pages)

    PrinterFactory.get_printer(output_path).tap do |printer|
      printer.print(most_visits)
      printer.print(unique_visits)
    end
  end
end
