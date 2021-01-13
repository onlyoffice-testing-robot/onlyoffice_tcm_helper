RSpec.describe OnlyofficeTcmHelper::TcmHelper, '#example_time_in_seconds' do
  tcm_helper = described_class.new(product_name: 'Product',
                                   plan_name: 'Plan',
                                   suite_name: description)
  it 'default time is one second' do
    expect(tcm_helper.parse(PseudoExamplePassed.new).result_message)
      .to include('{"title":"elapsed","value":"1s"}')
  end

  it 'custom time is not one second' do
    expect(tcm_helper.parse(PseudoExamplePassed.new('Old test', Time.now - 1_000)).result_message)
      .not_to include('{"title":"elapsed","value":"1s"}')
  end
end
