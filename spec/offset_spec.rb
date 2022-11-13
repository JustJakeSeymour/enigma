
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

  it 'turns the string of date into a squared integer' do
    expect(offset2.date_squared).to eq 15154841025
  end

  it 'takes the four last digits of the squared date' do
    expect(offset2.date_squared_last_four).to eq '1025'
  end

  it 'add those digits into a hash with keys correlating to key class' do
    expect(offset2.hash).to eq({
                                :A => 1,
                                :B => 0,
                                :C => 2,
                                :D => 5
                              })
  end

  it 'adjusts the supplied date to be 5 digits if over or under 5 is supplied' do
    offset3 = Offset.new('345')
    offset4 = Offset.new('345678')

    expect(offset3.date).to eq '00345'
    expect(offset4.date).to eq '45678'
  end
  
  it 'ignores anything given in the date that is not an integer' do
    offset3 = Offset.new('3x4!5')
    offset4 = Offset.new('x4x5x6x7x8')
    
    expect(offset3.date).to eq '00345'
    expect(offset4.date).to eq '45678'
  end
end