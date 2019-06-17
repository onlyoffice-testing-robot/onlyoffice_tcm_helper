# frozen_string_literal: true

# class is describe object like RSpec::Core::Example with error in expected code
class PseudoExampleFailed < PseudoExample
  def metadata
    {
      description: 'Test for create failed status result',
      execution_result: ExecutingResult.new
    }
  end

  def exception
    'expected: falsey value
     got: true'
  end
end
