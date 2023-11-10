# frozen_string_literal: true

require_relative 'application'

class DrugCounter < Application
  attr_reader :data_hash

  def initialize(data_hash)
    @data_hash = data_hash
  end

  def call
    count_data
  end

  private

  def count_data
    data_hash.transform_values { |drug| counting(drug).values }
  end

  def counting(drug)
    drug.transform_values do |events|
      valid_events = validate_events(events)
      returned = returned_drugs(valid_events)
      filled = filled_counter(valid_events, returned)
      total_count(returned, filled)
    end
  end

  def validate_events(events)
    events.drop_while { |event| event != 'created' }
  end

  def returned_drugs(valid_events)
    valid_events.count('returned')
  end

  def filled_counter(valid_events, returned)
    valid_events.count('filled') - returned
  end

  def total_count(returned, filled)
    [filled, ((filled * 5) - returned)]
  end
end
