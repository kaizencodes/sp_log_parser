# frozen_string_literal: true

RSpec.describe PrinterFactory do
  describe 'get_printer' do
    let(:factory) { described_class }
    subject(:get_printer) { factory.get_printer(file_path) }

    context 'file path is missing' do
      let(:file_path) {}

      it 'returns a StandardPrinter' do
        expect(get_printer).to be_a(StandardPrinter)
      end
    end

    context 'file path is present' do
      let(:file_path) { File.expand_path('spec/fixtures/printer_factory.log') }

      it 'returns a LogPrinter' do
        expect(get_printer).to be_a(LogPrinter)
      end
    end
  end
end
