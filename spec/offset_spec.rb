
require './lib/offset'

RSpec.describe Offset do
  let!(:offset1) {Offset.new}
  let!(:offset2) {Offset.new('123105')}
  
  it 'is created as an Offset class and an optional string argument' do
    expect(offset1).to be_an_instance_of Offset
    expect(offset2).to be_an_instance_of Offset
  end
  
  it 'creates an offset date (ddmmyy) if one is not given' do
    expect(offset1.date).to eq Time.now.strftime '%d%m%y'
    expect(offset1.date.length).to eq 6
    expect(offset2.date).to eq '123105'
  end

  it 'turns the string of date into a squared number' do
    
  end

  it 'takes the four last digits of the squared date' do
    
    
  end

  it 'add those digits into a hash with keys correlating to key class' do
    
    
  end
  
  
end