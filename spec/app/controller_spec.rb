# frozen_string_literal: true

require_relative '../../app/controller'

RSpec.describe Controller, :integration do
  describe 'call' do
    subject(:call) { described_class.new(input_path, output_path).call }
    let(:output_path) {}

    context "input_path is not given" do
      let(:input_path) {}

      it "returns error message" do
        expect { call }.to output("No file has been given.\n").to_stdout
      end
    end

    context 'input_path is given' do
      context "when the file doesn't exist" do
        let(:input_path) { File.expand_path('spec/fixtures/foobar.log') }

        it "returns error message" do
          expect { call }.to output("The file is not found.\n").to_stdout
        end
      end

      context 'when the file exists' do
        context 'when no page is visited' do
          let(:input_path) { File.expand_path('spec/fixtures/empty.log') }
          let(:expected_result) do
            "We can't list the total page views as there are no views.\n" \
              "We can't list the unique page views as there are no views.\n"
          end

          it "returns message" do
            expect { call }.to output(expected_result).to_stdout
          end
        end

        context "when pages are visited" do
          let(:input_path) { File.expand_path('spec/fixtures/integration.log') }

          context "output_path is not given" do
            let(:expected_result) do
              "list of webpages with most page views ordered from most pages views to less page views\n" \
              "/home 10 visits\n/about 10 visits\n/contact 8 visits\n/help_page/1 5 visits\n" \
              "/about/2 5 visits\n/index 4 visits\n" \
              "list of webpages with most unique page views ordered from most unique views to less unique views\n" \
              "/home 8 unique visits\n/about 8 unique visits\n/contact 6 unique visits\n" \
              "/about/2 5 unique visits\n/help_page/1 4 unique visits\n" \
              "/index 4 unique visits\n"
            end

            it "returns message" do
              expect { call }.to output(expected_result).to_stdout
            end
          end

          context "output path is given" do
            let(:output_path) { File.expand_path('spec/fixtures/integration_out.log') }

            let(:expected_result) do
              "list of webpages with most page views ordered from most pages views to less page views\n" \
              "/home 10 visits\n/about 10 visits\n/contact 8 visits\n/help_page/1 5 visits\n" \
              "/about/2 5 visits\n/index 4 visits\n" \
              "list of webpages with most unique page views ordered from most unique views to less unique views\n" \
              "/home 8 unique visits\n/about 8 unique visits\n/contact 6 unique visits\n" \
              "/about/2 5 unique visits\n/help_page/1 4 unique visits\n" \
              "/index 4 unique visits\n"
            end

            after do
              File.delete(output_path) if File.exist?(output_path)
            end

            it "returns message to file" do
              call
              expect(File.read(output_path)).to eq expected_result
            end
          end
        end
      end
    end
  end
end
