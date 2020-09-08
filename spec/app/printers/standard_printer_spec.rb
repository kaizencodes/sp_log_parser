# frozen_string_literal: true

RSpec.describe StandardPrinter do
  describe 'print' do
    subject(:print) { printer.print(payload) }
    let(:printer) { described_class.new }
    let(:payload) { 'some string to be printed' }

    it 'prints the output to the standard output' do
      expect { print }.to output("some string to be printed\n").to_stdout
    end
  end
end
