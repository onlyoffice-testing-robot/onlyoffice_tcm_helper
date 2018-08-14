require 'json'
RSpec.describe OnlyofficeTcmHelper do
  describe 'Check message' do
    tcm_helper = OnlyofficeTcmHelper::TcmHelper.new(product_name: 'Product',
                                                    plan_name: 'Plan',
                                                    suite_name: description)
    it 'check message | subdescriber exist' do
      result_message = tcm_helper.parse(PseudoExamplePassed.new('check comment for passed status')).result_message
      expect(JSON.parse(result_message)['subdescriber'].empty?).to be_falsey
    end

    it 'check message | subdescriber elapsed check' do
      result_message = tcm_helper.parse(PseudoExamplePassed.new('check comment for passed status')).result_message
      expect(JSON.parse(result_message)['subdescriber'][0]['title']).to eq('elapsed')
      expect(JSON.parse(result_message)['subdescriber'][0]['value']).to eq('1s')
    end

    it 'check message | subdescriber custom_host not exist' do
      result_message = tcm_helper.parse(PseudoExamplePassed.new('check comment for passed status')).result_message
      expect(JSON.parse(result_message)['subdescriber'][1]['title']).to eq('custom_host')
      expect(JSON.parse(result_message)['subdescriber'][1]['value']).not_to be_empty
    end

    it 'check message | describer' do
      passed = PseudoExamplePassed.new('check comment for passed status')
      result_message = tcm_helper.parse(passed).result_message
      expect(JSON.parse(result_message)['describer'].first['value']).to eq(tcm_helper.parse(passed).comment)
    end
  end
end
