require_relative 'application'

class Performance < Application
  attr_reader :reader, :file_path, :data_collector

  def initialize(reader, file_path, data_collector)
    @reader = reader
    @file_path = file_path
    @data_collector = data_collector
  end

  def call
    read_file = reader.call(file_path)
    data_collector.call(read_file)
  end
end
