require './lib/shift'
require './lib/key'
require './lib/offset'

RSpec.describe Shift do
  it 'creates a Shift class with key and offset hashes as arguments' do
    key = Key.new
    offset = Offset.new
    shift = Shift.new(key.hash, offset.hash)
    expect(shift).to be_an_instance_of Shift
  end
  
  it 'holds a hash which is the sum of the key and offset values' do
    key = Key.new
    offset = Offset.new
    shift = Shift.new(key.hash, offset.hash)

    expect(shift.hash[:A]).to be_an_instance_of Integer
    expect(shift.hash[:B]).to be_an_instance_of Integer
    expect(shift.hash[:C]).to be_an_instance_of Integer
    expect(shift.hash[:D]).to be_an_instance_of Integer
  end
end