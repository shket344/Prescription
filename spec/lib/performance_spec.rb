# frozen_string_literal: true

require_relative '../../lib/performance'
require_relative '../../lib/reader'
require_relative '../../lib/data_collector'
require_relative '../../lib/drug_counter'
require_relative '../../lib/total_income'
require_relative '../../lib/printer'

describe Performance do
  describe '#call' do
    subject { described_class.call(reader, file_path, data_collector, drug_counter, total_income, printer) }

    context 'with valid params' do
      let(:file_path) { 'spec/fixtures/test.txt' }
      let(:reader) { Reader }
      let(:data_collector) { DataCollector }
      let(:drug_counter) { DrugCounter }
      let(:total_income) { TotalIncome }
      let(:printer) { Printer }
      let(:expected_output) do
        "\"Nick: 1 fills $5 income\"\n\"Mark: 0 fills $0 income\"\n"
      end

      before do
        allow(Reader).to receive(:call).with(file_path)
                                       .and_return("Nick A created\nNick A filled\nMark B filled\nMark B filled\n")
      end

      it 'performs all classes and print results' do
        expect { subject }.to output(expected_output).to_stdout
      end
    end
  end
end
