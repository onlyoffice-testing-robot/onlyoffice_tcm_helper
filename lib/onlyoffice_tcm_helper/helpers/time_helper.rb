# frozen_string_literal: true

# namespace
module OnlyofficeTcmHelper
  # it is helper for work with time class
  module TimeHelper
    # Example time in seconds
    # @param [Object] example with data
    # @return [String] time in seconds
    def example_time_in_seconds(example)
      execution_time = (Time.now - example.metadata[:execution_result].started_at).to_i
      execution_time = 1 if execution_time.zero? # Testrail cannot receive 0 as elapsed time
      "#{execution_time}s"
    end
  end
end
