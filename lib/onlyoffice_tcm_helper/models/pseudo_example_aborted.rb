# class is describe object like RSpec::Core::Example with error in no expected code
class PseudoExampleAborted < PseudoExample
  def exception
    "undefined local variable or method `tasdasdrue' for #<RSpec::ExampleGroups::OnlyofficeTcmHelper::StatusChecks:0x000000020b8400>"
  end
end