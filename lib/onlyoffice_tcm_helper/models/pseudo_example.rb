# frozen_string_literal: true

require_relative 'sub_elements/executing_result'
# class is describe object like RSpec::Core::Example
class PseudoExample
  attr_reader :description, :execution_result

  def initialize(description = 'Check something')
    @description = description
    @execution_result = ExecutingResult.new
  end

  def metadata
    {
      description: @description,
      execution_result: @execution_result,
      absolute_file_path: __FILE__
    }
  end

  def exception; end

  def pending?
    false
  end
end
