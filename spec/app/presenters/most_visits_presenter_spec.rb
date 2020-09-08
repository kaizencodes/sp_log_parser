# frozen_string_literal: true

RSpec.describe MostVisitsPresenter do
  describe 'to_s' do
    subject(:to_s) { described_class.new(pages: pages).to_s }
    let(:pages) do
      [
        Page.new('/help_page/1', ips: [Ip.new('126.318.035.038')]),
        Page.new('/about'),
        Page.new('/contact', ips: [Ip.new('184.123.665.0678'), Ip.new('184.123.665.063')])
      ]
    end

    let(:expected_result) do
      "list of webpages with most page views ordered from most pages" \
        " views to less page views\n/contact 2 visits\n/help_page/1 1 visit\n" \
        "/about 0 visit"
    end

    it 'builds present' do
      expect(to_s).to eq(expected_result)
    end

    context 'without input' do
      let(:pages) { [] }

      it 'returns fallback message for empty pages.' do
        expect(to_s).to eq "We can't list the total page views as there are no views."
      end
    end
  end
end
