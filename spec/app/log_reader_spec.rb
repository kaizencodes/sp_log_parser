# frozen_string_literal: true

require 'dummy_processor'

RSpec.describe LogReader do
  describe 'read_line' do
    let(:reader) { described_class.new(file_path) }
    subject(:read_line) { -> { reader.read_line { |line| dummy_processor.process(line) } } }
    let(:dummy_processor) { DummyProcessor.new }
    let(:file_path) { File.expand_path('spec/fixtures/log_reader_input.log') }

    it 'reads the file line by line' do
      read_line.call
      expect(dummy_processor.collection.size).to eq 3
      expect(dummy_processor.collection[0].path).to eq("/help_page/1")
      expect(dummy_processor.collection[0].ip).to eq("126.318.035.038")
      expect(dummy_processor.collection[1].path).to eq("/contact")
      expect(dummy_processor.collection[1].ip).to eq("184.123.665.067")
      expect(dummy_processor.collection[2].path).to eq("/home")
      expect(dummy_processor.collection[2].ip).to eq("184.123.665.067")
    end
  end
end
