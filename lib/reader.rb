# frozen_string_literal: true

require_relative 'application'

class Reader < Application
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    raise StandardError unless File.exist?(file_path)

    empty?(File.read(file_path))
  end

  private

  def empty?(file)
    return file unless file.empty?

    warn "#{file_path} is empty"
    exit
  end
end
