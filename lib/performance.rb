require_relative 'application'

class Performance < Application
  attr_reader :reader, :file_path

  def initialize(reader, file_path)
    @reader = reader
    @file_path = file_path
  end

  def call
    reader.call(file_path)
  end
end
