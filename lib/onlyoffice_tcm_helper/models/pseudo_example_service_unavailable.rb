# frozen_string_literal: true

# class is describe object like RSpec::Core::Example with special tag
class PseudoExampleServiceUnavailable < PseudoExample
  # @return [String] exception string
  def exception
    'Service Unavailable: 503'
  end
end
