# frozen_string_literal: true

RSpec.describe Ip do
  describe 'valid?' do
    subject(:validate) { ip.valid? }
    let(:ip) { described_class.new(address) }

    context "with missing block" do
      let(:address) { "192.168.1" }

      it { is_expected.to be_falsy }
    end

    context "with letters" do
      let(:address) { "192.168.1b" }

      it { is_expected.to be_falsy }
    end

    context "with more blocks" do
      let(:address) { "192.168.1.123.134" }

      it { is_expected.to be_falsy }
    end

    context "with more numbers in block" do
      let(:address) { "192.168122.1" }

      it { is_expected.to be_falsy }
    end

    context "with correct format" do
      let(:address) { "192.168.1.1" }

      it { is_expected.to be_truthy }
    end
  end
end
