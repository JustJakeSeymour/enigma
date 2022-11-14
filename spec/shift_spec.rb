# frozen_string_literal: true

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

  it 'holds an array of characters to be rotated' do
    key = Key.new
    offset = Offset.new
    shift = Shift.new(key.hash, offset.hash)

    expect(shift.alphabet_array.length).to eq 27
    expect(shift.alphabet_array[0]).to eq 'a'
  end

  it 'holds an array of positive rotated alphabet arrays' do
    key = Key.new
    offset = Offset.new
    shift = Shift.new(key.hash, offset.hash)

    expect(shift.rotate_forwards.length).to eq 4
    expect(shift.rotate_forwards[0]).to be_an_instance_of Array
    expect(shift.rotate_forwards[0].length).to eq 27
    expect(shift.rotate_forwards[0][0]).to be_an_instance_of String
  end

  it 'holds an array of negative rotated alphabet arrays' do
    key = Key.new
    offset = Offset.new
    shift = Shift.new(key.hash, offset.hash)

    expect(shift.rotate_backwards.length).to eq 4
    expect(shift.rotate_backwards[0]).to be_an_instance_of Array
    expect(shift.rotate_backwards[0].length).to eq 27
    expect(shift.rotate_backwards[0][0]).to be_an_instance_of String
  end
end
