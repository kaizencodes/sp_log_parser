# frozen_string_literal: true

RSpec.describe FileValidator do
  describe 'validate' do
    subject(:validate) { validator.validate }
    let(:validator) { described_class.new(path) }

    context 'when path is not given' do
      let(:path) {}

      it 'returns error message' do
        expect(validate).to eq 'No file has been given.'
      end
    end

    context 'when path is given but file is not found' do
      let(:path) { 'spec/fixtures/foobar.log' }

      it 'returns error message' do
        expect(validate).to eq 'The file is not found.'
      end
    end

    context 'when path is given and file is present' do
      let(:path) { 'spec/fixtures/file_validator.log' }

      it 'does not return error message' do
        expect(validate).to be_nil
      end
    end
  end
end
