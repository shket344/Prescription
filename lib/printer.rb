# frozen_string_literal: true

require_relative 'application'

class Printer < Application
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    print_data
  end

  private

  def print_data
    data.each do |key, value|
      filled, income = value
      prefix = income.negative? ? '-' : ''
      p "#{key}: #{filled} fills #{prefix}$#{income.abs} income"
    end
  end
end
