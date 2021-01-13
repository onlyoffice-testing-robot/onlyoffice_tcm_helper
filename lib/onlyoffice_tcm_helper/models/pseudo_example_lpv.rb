# frozen_string_literal: true

# class is describe object like RSpec::Core::Example with special tag
class PseudoExampleLPV < PseudoExample
  # @return [String] exception string
  def exception
    'Limited program version'
  end
end
