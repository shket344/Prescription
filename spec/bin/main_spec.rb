# frozen_string_literal: true

require 'open3'

describe 'script' do
  let(:stdoutput) { Open3.capture3("./bin/main #{file}") }
  let(:file) { 'spec/fixtures/test.txt' }
  let(:result) { stdoutput[0] }
  let(:errors) { stdoutput[1] }
  let(:expected_result) { "\"Nick: 1 fills $5 income\"\n\"Mark: 0 fills $0 income\"\n" }

  context 'with valid params' do
    before do
      allow(Open3).to receive(:capture3).with("./bin/main #{file}")
                                        .and_return([expected_result, ''])
    end

    it 'returns counted results and no errors' do
      expect(result).to eq expected_result
      expect(errors).to be_empty
    end
  end

  context 'when file not provided' do
    let(:file) {}

    it { expect(errors).to eq "Please, write file name\n" }
  end

  context 'when file not valid' do
    let(:file) { 'spec/fixtures/invalid.txt' }

    it { expect(errors).to include 'StandardError' }
  end
end
