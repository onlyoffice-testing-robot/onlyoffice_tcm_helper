RSpec.describe OnlyofficeTcmHelper do
  describe 'Tests for tcm helper' do
    tcm_helper = OnlyofficeTcmHelper::TcmHelper.new(product: 'Product',
                                                    plan: 'Plan',
                                                    suite: description)

    describe 'status checks' do

      it 'Check getting passed status' do
        expect(tcm_helper.parse(PseudoExamplePassed.new('Check getting passed status')).status).to eq(:passed)
      end

      it 'Check getting passed_2 status' do
        tcm_helper.parse(PseudoExamplePassed.new('Check getting passed_2 status'))
        pseudo_example = PseudoExamplePassed.new('Check getting passed_2 status')
        expect(tcm_helper.parse(pseudo_example).status).to eq(:passed_2)
      end

      it 'Check getting failed status' do
        expect(tcm_helper.parse(PseudoExampleFailed.new('Check getting failed status')).status).to eq(:failed)
      end

      it 'Check getting aborted status' do
        expect(tcm_helper.parse(PseudoExampleAborted.new('Check getting aborted status')).status).to eq(:aborted)
      end

      it 'Check getting pending status' do
        expect(tcm_helper.parse(PseudoExamplePending.new('Check getting pending status')).status).to eq(:pending)
      end

      it 'Check getting service_unavailable status' do
        expect(tcm_helper.parse(
            PseudoExampleServiceUnavailable.new('Check getting service_unavailable status')
        ).status).to eq(:service_unavailable)
      end

      it 'Check getting lpv status' do
        expect(tcm_helper.parse(
            PseudoExampleLPV.new('Check getting service_unavailable status')
        ).status).to eq(:lpv)
      end
    end

    describe 'comments check' do
      it 'check comment for passed status' do
        expect(tcm_helper.parse(PseudoExamplePassed.new('check comment for passed status')).comment).to eq("\nOk")
      end

      it 'check comment for passed_2 status' do
        tcm_helper.parse(PseudoExamplePassed.new('check comment for passed_2 status'))
        expect(tcm_helper.parse(PseudoExamplePassed.new('check comment for passed_2 status')).comment).to eq("\nPassed 2")
      end

      it 'check comment for failed status' do
        expect(tcm_helper.parse(PseudoExampleFailed.new('check comment for passed_2 status')).comment).not_to be_empty
      end

      it 'check comment for aborted status' do
        expect(tcm_helper.parse(PseudoExampleAborted.new('check comment for aborted status')).comment).not_to be_empty
      end

      it 'check comment for pending status' do
        expect(tcm_helper.parse(PseudoExamplePending.new('check comment for pending status')).comment).to eq('Pending exception')
      end

      it 'check comment for service_unavailable status' do
        expect(tcm_helper.parse(PseudoExampleServiceUnavailable.new('check comment for service_unavailable status')).comment).to eq("\nService Unavailable: 503")
      end

      it 'check comment for lpv status' do
        expect(tcm_helper.parse(PseudoExampleLPV.new('check comment for lpv status')).comment).to eq("\nLimited program version")
      end
    end
  end
end
