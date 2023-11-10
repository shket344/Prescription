# frozen_string_literal: true

require_relative '../../lib/printer'

describe Printer do
  describe '#call' do
    subject { described_class.call(data) }

    context 'when data valid' do
      let(:data) do
        { 'Nick' => [3, 8], 'Mark' => [0, 0] }
      end
      let(:expected_output) do
        "\"Nick: 3 fills $8 income\"\n\"Mark: 0 fills $0 income\"\n"
      end

      it 'print results' do
        expect { subject }.to output(expected_output).to_stdout
      end
    end
  end
end
