require 'bundler/setup'
require 'onlyoffice_tcm_helper'
require_relative '../lib/onlyoffice_tcm_helper/models/PseudoExample'
require_relative '../lib/onlyoffice_tcm_helper/models/PseudoExamplePassed'
require_relative '../lib/onlyoffice_tcm_helper/models/PseudoExampleFailed'
require_relative '../lib/onlyoffice_tcm_helper/models/PseudoExampleAborted'
require_relative '../lib/onlyoffice_tcm_helper/models/PseudoExamplePending'
require_relative '../lib/onlyoffice_tcm_helper/models/PseudoExampleServiceUnavailable'
require_relative '../lib/onlyoffice_tcm_helper/models/PseudoExampleLPV'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
