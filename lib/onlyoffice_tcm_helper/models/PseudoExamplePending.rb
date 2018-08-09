require_relative 'sub_elements/ExecutingResultPending'
class PseudoExamplePending < PseudoExample

  def initialize(description)
    super(description)
    @execution_result = ExecutingResultPending.new
  end

  def pending?
    true
  end
end