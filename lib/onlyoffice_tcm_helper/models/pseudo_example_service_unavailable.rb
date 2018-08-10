# class is describe object like RSpec::Core::Example with special tag
class PseudoExampleServiceUnavailable < PseudoExample
  def exception
    'Service Unavailable: 503'
  end
end
