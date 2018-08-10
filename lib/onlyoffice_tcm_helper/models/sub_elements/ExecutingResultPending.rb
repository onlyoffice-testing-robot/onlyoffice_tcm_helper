# class is describe same RSpec::Core::Example::ExecutingResult with pending status
class ExecutingResultPending
  attr_reader :started_at, :pending_message

  def initialize
    @started_at = Time.now
    @pending_message = 'Pending exception'
  end
end
