require_relative 'application'

class Performance < Application
  attr_reader :reader, :file_path, :data_collector, :drug_counter

  def initialize(reader, file_path, data_collector, drug_counter)
    @reader = reader
    @file_path = file_path
    @data_collector = data_collector
    @drug_counter = drug_counter
  end

  def call
    read_file = reader.call(file_path)
    collected_data = data_collector.call(read_file)
    drug_counter.call(collected_data)
  end
end
