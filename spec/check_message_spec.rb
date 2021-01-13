# frozen_string_literal: true

require 'json'
RSpec.describe OnlyofficeTcmHelper do
  describe 'Check message' do
    tcm_helper = OnlyofficeTcmHelper::TcmHelper.new(product_name: 'Product',
                                                    plan_name: 'Plan',
                                                    suite_name: description)
    it 'check message | subdescriber exist' do
      result_message = tcm_helper.parse(PseudoExamplePassed.new('check comment for passed status')).result_message
      expect(JSON.parse(result_message)['subdescriber']).not_to be_empty
    end

    describe 'check message | subdescriber elapsed check' do
      result_message = tcm_helper.parse(PseudoExamplePassed.new('check comment for passed status')).result_message

      it 'title is elapsed' do
        expect(JSON.parse(result_message)['subdescriber'][0]['title']).to eq('elapsed')
      end

      it 'value is 1s' do
        expect(JSON.parse(result_message)['subdescriber'][0]['value']).to eq('1s')
      end
    end

    describe 'check message | subdescriber custom_host not exist' do
      result_message = tcm_helper.parse(PseudoExamplePassed.new('check comment for passed status')).result_message

      it 'title is custom_host' do
        expect(JSON.parse(result_message)['subdescriber'][1]['title']).to eq('custom_host')
      end

      it 'value is not empty' do
        expect(JSON.parse(result_message)['subdescriber'][1]['value']).not_to be_empty
      end
    end

    it 'check message | describer' do
      passed = PseudoExamplePassed.new('check comment for passed status')
      result_message = tcm_helper.parse(passed).result_message
      expect(JSON.parse(result_message)['describer'].first['value']).to eq(tcm_helper.parse(passed).comment)
    end
  end
end
