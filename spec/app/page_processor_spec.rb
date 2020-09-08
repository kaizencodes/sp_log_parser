# frozen_string_literal: true

require 'dummy_reader'

RSpec.describe PageProcessor do
  describe 'process' do
    let(:processor) { described_class.new(reader) }
    let(:reader) { DummyReader.new(collection) }

    subject(:process) { processor.process }
    let(:collection) do
      [
        ParsedLine.new('/help_page/1', '126.318.035.038'),
        ParsedLine.new('/contact', '184.123.665.067'),
        ParsedLine.new('/home', '184.123.665.067'),
        ParsedLine.new('/about', '1.2.3'),
        ParsedLine.new('342', '184.123.665.067'),
      ]
    end

    it 'processes the input, skips invalid entries' do
      pages = process
      expect(pages.size).to eq 3
      expect(pages[0].path).to eq "/help_page/1"
      expect(pages[0].page_views.size).to eq 1

      expect(pages[1].path).to eq "/contact"
      expect(pages[1].page_views.size).to eq 1

      expect(pages[2].path).to eq "/home"
      expect(pages[2].page_views.size).to eq 1
    end
  end
end
