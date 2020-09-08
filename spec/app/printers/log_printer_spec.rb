# frozen_string_literal: true

RSpec.describe LogPrinter do
  describe 'print' do
    subject(:print) { printer.print(payload) }
    let(:printer) { described_class.new(path) }
    let(:payload) { 'some string to be printed' }
    let(:path) { File.expand_path('spec/fixtures/log_printer_output.log') }

    after do
      File.delete(path) if File.exist?(path)
    end

    it 'prints the payload to the specified file with newline' do
      print
      expect(File.read(path)).to eq "some string to be printed\n"
    end
  end
end
