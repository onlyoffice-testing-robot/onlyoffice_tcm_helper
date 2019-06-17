# frozen_string_literal: true

# class is describe object like RSpec::Core::Example with special tag
class PseudoExampleLPV < PseudoExample
  def exception
    'Limited program version'
  end
end
