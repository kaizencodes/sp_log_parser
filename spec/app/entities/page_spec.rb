# frozen_string_literal: true

RSpec.describe Page do
  describe 'valid?' do
    subject(:validate) { page.valid? }
    let(:page) { described_class.new(path) }

    context "with / at the begining" do
      let(:path) { "/about" }

      it { is_expected.to be_truthy }
    end

    context "without / at the begining" do
      let(:path) { "about" }

      it { is_expected.to be_falsy }
    end
  end
end
