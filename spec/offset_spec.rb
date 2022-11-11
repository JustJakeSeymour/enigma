require './lib/offset'

RSpec.describe Offset do
  let!(offset1) {Offset.new}
  let!(offset2) {Offset.new('12/31/05')}
  
  it 'is created as an Offset class and an optional string argument' do
    expect(offset1).to be_an_instance_of Offset
    expect(offset2).to be_an_instance_of Offset
    expect(offset2.date).to eq Time.parse('12/31/05')
  end
  
end