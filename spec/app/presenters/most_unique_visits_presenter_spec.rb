# frozen_string_literal: true

RSpec.describe MostUniqueVisitsPresenter do
  describe 'to_s' do
    subject(:to_s) { described_class.new(pages: pages).to_s }
    let(:pages) do
      [
        Page.new('/help_page/1', ips: [Ip.new('126.318.035.038'), Ip.new('126.318.035.038'), Ip.new('126.318.035.038')]),
        Page.new('/about'),
        Page.new('/contact', ips: [Ip.new('184.123.665.0678'), Ip.new('184.123.665.063')])
      ]
    end

    let(:expected_result) do
      "list of webpages with most unique page views ordered from most unique views " \
        "to less unique views\n/contact 2 unique visits\n/help_page/1 1 unique visit\n" \
        "/about 0 unique visit"
    end

    it 'builds present' do
      expect(to_s).to eq(expected_result)
    end

    context 'without input' do
      let(:pages) { [] }

      it 'returns fallback message for empty pages.' do
        expect(to_s).to eq "We can't list the unique page views as there are no views."
      end
    end
  end
end
