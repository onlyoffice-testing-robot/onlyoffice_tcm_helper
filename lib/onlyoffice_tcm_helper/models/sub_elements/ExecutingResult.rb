class ExecutingResult
  attr_reader :started_at

  def initialize
    @started_at = Time.now
  end
end
