require '/.lib/key'

RSpec.describe Key do
  let!(:key1) {Key.new}
  let!(:key2) {Key.new('02341')}
  
  it 'creates as a Key and an optional argument' do
    expect(key1).to be_an_instance_of Key
    expect(key2).to be_an_instance_of Key
  end

  it 'generates a random 5 digit number is argument is not given' do
    expect(key1.key.length).to eq 5
    expect(key2.key.length).to eq 5
    expect(key2.key).to eq '02341'
  end

  
end