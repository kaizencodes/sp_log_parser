# frozen_string_literal: true

require 'dummy_reader'

RSpec.describe PageProcessor do
  describe 'process' do
    let(:processor) { described_class.new(reader) }
    let(:reader) { DummyReader.new(collection) }

    subject(:process) { processor.process }
    let(:collection) do
      [
        ParsedLine.new(ip: '126.318.035.038', path: '/help_page/1'),
        ParsedLine.new(ip: '184.123.665.067', path: '/contact'),
        ParsedLine.new(ip: '184.123.665.067', path: '/home')
      ]
    end

    it 'processes the line' do
      pages = process
      expect(pages.size).to eq 3
    end
  end
end
