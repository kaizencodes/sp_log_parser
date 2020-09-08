# frozen_string_literal: true

# selects printer class based on the path argument
class PrinterFactory
  def self.get_printer(path)
    if path
      LogPrinter.new(path)
    else
      StandardPrinter.new
    end
  end
end
