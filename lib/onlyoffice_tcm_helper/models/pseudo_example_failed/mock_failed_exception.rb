# Mock class to check exception
class MockFailedException
  def to_s
    'expected: falsey value
     got: true'
  end

  def backtrace
    ['trace_without_line',
     "#{Dir.pwd}/spec/onlyoffice_tcm_helper_spec.rb:3:in `get_status_and_comment",
     "#{Dir.pwd}/spec/onlyoffice_tcm_helper_spec.rb:4:in `parse"
     ]
  end
end