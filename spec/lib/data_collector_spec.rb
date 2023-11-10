# frozen_string_literal: true

require_relative '../../lib/data_collector'

describe DataCollector do
  describe '#call' do
    subject { described_class.call(data) }

    context 'when data valid' do
      let(:data) { "Nick A created\nNick A filled\nMark B filled\nMark B filled\n" }
      let(:expected_result) do
        { 'Nick' => { 'A' => %w[created filled] }, 'Mark' => { 'B' => %w[filled filled] } }
      end

      it 'returns collected data by name and drug' do
        expect(subject).to eq expected_result
      end
    end
  end
end
