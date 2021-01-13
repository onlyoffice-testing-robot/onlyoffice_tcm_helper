# frozen_string_literal: true

require_relative 'pseudo_example_failed/mock_failed_exception'

# class is describe object like RSpec::Core::Example with error in expected code
class PseudoExampleFailed < PseudoExample
  def initialize(description = 'Check something',
                 exception_with_failed_lines: false)
    @exception_with_failed_lines = exception_with_failed_lines
    super(description)
  end

  def metadata
    {
      description: 'Test for create failed status result',
      execution_result: ExecutingResult.new,
      absolute_file_path: "#{Dir.pwd}/spec/onlyoffice_tcm_helper_spec.rb"
    }
  end

  def exception
    return MockFailedException.new if @exception_with_failed_lines

    'expected: falsey value
     got: true'
  end
end
