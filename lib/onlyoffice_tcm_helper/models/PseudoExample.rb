require_relative 'sub_elements/ExecutingResult'
class PseudoExample
  attr_reader :description, :execution_result

  def initialize(description = 'Check something')
    @description = description
    @execution_result = ExecutingResult.new
  end

  def metadata
    {
      description: @description,
      execution_result: nil,
      absolute_file_path: __FILE__
    }
  end

  def exception; end

  def pending?
    false
  end
end