require_relative 'application'

class TotalIncome < Application
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    data.transform_values { |value| value.transpose.map(&:sum) }
  end
end
