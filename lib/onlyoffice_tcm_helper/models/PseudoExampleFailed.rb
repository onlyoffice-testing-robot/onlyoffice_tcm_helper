class PseudoExampleFailed < PseudoExample
  def metadata
    {
      description: 'Test for create failed status result',
      execution_result: nil
    }
  end

  def exception
    'expected: falsey value
     got: true'
  end
end
