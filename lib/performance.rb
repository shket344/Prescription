require_relative 'application'

class Performance < Application
  attr_reader :reader, :file_path, :data_collector, :drug_counter, :total_income

  def initialize(reader, file_path, data_collector, drug_counter, total_income)
    @reader = reader
    @file_path = file_path
    @data_collector = data_collector
    @drug_counter = drug_counter
    @total_income = total_income
  end

  def call
    read_file = reader.call(file_path)
    collected_data = data_collector.call(read_file)
    counted_data = drug_counter.call(collected_data)
    total_income.call(counted_data)
  end
end
