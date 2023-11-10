# frozen_string_literal: true

require_relative '../../lib/drug_counter'

describe DrugCounter do
  describe '#call' do
    subject { described_class.call(data) }

    context 'when data valid' do
      let(:data) do
        { 'Nick' => { 'A' => %w[created filled] }, 'Mark' => { 'B' => %w[filled filled] } }
      end
      let(:expected_result) do
        { 'Nick' => [[1, 5]], 'Mark' => [[0, 0]] }
      end

      it 'returns collected data by name and drug' do
        expect(subject).to eq expected_result
      end
    end
  end
end
