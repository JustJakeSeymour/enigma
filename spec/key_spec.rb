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

  it 'separates 5 integer string into 4 hash places' do
    expect(key2.hash).to eq ({:A => '02',
                              :B => '23',
                              :C => '34',
                              :D => '41'})
  end
end