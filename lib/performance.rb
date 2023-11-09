# frozen_string_literal: true

require_relative 'application'

class Performance < Application
  attr_reader :reader, :file_path, :data_collector, :drug_counter, :total_income, :printer

  def initialize(reader, file_path, data_collector, drug_counter, total_income, printer)
    @reader = reader
    @file_path = file_path
    @data_collector = data_collector
    @drug_counter = drug_counter
    @total_income = total_income
    @printer = printer
  end

  def call
    read_file = reader.call(file_path)
    collected_data = data_collector.call(read_file)
    counted_data = drug_counter.call(collected_data)
    total_data = total_income.call(counted_data)
    printer.call(total_data)
  end
end
