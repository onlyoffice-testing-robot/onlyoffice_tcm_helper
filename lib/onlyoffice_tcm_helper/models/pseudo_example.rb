# frozen_string_literal: true

require_relative 'sub_elements/executing_result'
# class is describe object like RSpec::Core::Example
class PseudoExample
  attr_reader :description, :execution_result

  def initialize(description = 'Check something', started_at = Time.now)
    @description = description
    @execution_result = ExecutingResult.new(started_at)
  end

  # @return [Hash] metadata of class
  def metadata
    {
      description: @description,
      execution_result: @execution_result,
      absolute_file_path: __FILE__
    }
  end

  # @return [nil] non-existing exception
  def exception; end

  # @return [false] is example pending
  def pending?
    false
  end
end
