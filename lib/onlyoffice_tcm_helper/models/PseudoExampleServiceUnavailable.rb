class PseudoExampleServiceUnavailable < PseudoExample
  def exception
    'Service Unavailable: 503'
  end
end
