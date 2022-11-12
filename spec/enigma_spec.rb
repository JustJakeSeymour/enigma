require './lib/enigma'
require './lib/shift'
require './lib/offset'
require './lib/key'

RSpec.describe Enigma do

  it 'initializes with arguments' do
    enigma1 = Enigma.new('filepath', 'filepath')
    enigma2 = Enigma.new('filepath', 'filepath', 'key', 'date')
    
    expect(enigma1).to be_an_instance_of Enigma
    expect(enigma2).to be_an_instance_of Enigma
  end
  
  it 'contains the filepath to read, and to write' do
    enigma1 = Enigma.new('read.txt', 'write.txt')
    expect(enigma1.read).to eq 'read.txt'
    expect(enigma1.write).to eq 'write.txt'
  end
  
  it 'creates a Key object, even if one is not given' do
    enigma1 = Enigma.new('filepath', 'filepath')
    enigma2 = Enigma.new('filepath', 'filepath', '02341', 'date')
    
    expect(enigma1.key.key.length).to eq 5
    expect(enigma1.key).to be_an_instance_of Key
    
    expect(enigma2.key.key.length).to eq 5
    expect(enigma2.key.key).to eq '02341'
  end
  
  it 'creates an offset object, even if a date is not given' do
    enigma1 = Enigma.new('filepath', 'filepath')
    enigma2 = Enigma.new('filepath', 'filepath', '02341', '220385')
    
    expect(enigma1.offset.date.length).to eq 6
    expect(enigma1.offset).to be_an_instance_of Offset
    expect(enigma1.offset.date).to eq Time.now.strftime '%d%m%y'
    
    expect(enigma2.offset.date.length).to eq 6
    expect(enigma2.offset).to be_an_instance_of Offset
    expect(enigma2.offset.date).to eq '220385'
  end
end