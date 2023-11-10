# frozen_string_literal: true

require_relative '../../lib/total_income'

describe TotalIncome do
  describe '#call' do
    subject { described_class.call(data) }

    context 'when data valid' do
      let(:data) do
        { 'Nick' => [[1, 5], [2, 3]], 'Mark' => [[0, 0]] }
      end
      let(:expected_result) do
        { 'Nick' => [3, 8], 'Mark' => [0, 0] }
      end

      it 'returns final results' do
        expect(subject).to eq expected_result
      end
    end
  end
end
