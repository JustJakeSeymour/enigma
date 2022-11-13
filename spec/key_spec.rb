require './lib/key'

RSpec.describe Key do
  let!(:key1) {Key.new}
  let!(:key2) {Key.new('02341')}
  
  it 'creates as a Key and an optional argument' do
    expect(key1).to be_an_instance_of Key
    expect(key2).to be_an_instance_of Key
  end

  it 'generates a random 5 digit string is argument is not given' do
    expect(key1.key.length).to eq 5
    expect(key1.key).to be_an_instance_of String
    expect(key2.key.length).to eq 5
    expect(key2.key).to eq '02341'
  end

  it 'adjusts the supplied key to be 5 digits if over or under 5 is supplied' do
    key3 = Key.new('345')
    key4 = Key.new('345678')

    expect(key3.key).to eq '00345'
    expect(key4.key).to eq '45678'
  end
  
  it 'ignores anything given in the key that is not an integer' do
    key3 = Key.new('3x4!5')
    key4 = Key.new('x4x5x6x7x8')
    
    expect(key3.key).to eq '00345'
    expect(key4.key).to eq '45678'
  end

  it 'separates 5 integer strings into 4 hash places, back to integers' do
    expect(key2.hash).to eq ({:A => 02,
                              :B => 23,
                              :C => 34,
                              :D => 41})
  end
end