require './lib/enigma'
require './lib/shift'
require './lib/offset'
require './lib/key'

RSpec.describe Enigma do

  describe 'attributes' do
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
  
  describe 'encrypting and decrypting' do
    let!(:enigma) {Enigma.new('./lib/read.txt', 'write.txt', '01234', '111122')}

    it 'holds an array of the alphabet, plus a space' do
      expect(enigma.alphabet_array.length).to eq 27
      expect(enigma.alphabet_array).to be_an_instance_of Array
    end
    
    it 'reads a text file into a string' do
      expect(enigma.read_file_to_string).to eq 'this is a test'
    end

    it 'can rewrite a sting based on the shift hash lengths' do
      expect(enigma.shift_to_ciphertext).to be_an_instance_of String
      expect(enigma.shift_to_ciphertext).to eq "bsmlitwtjkxyad"
    end
    
    it 'uses a shift object to rearrange string, but backwards' do
      enigma2 = Enigma.new('./lib/cipher.txt', 'write.txt', '01234', '111122')
      expect(enigma2.unshift_from_ciphertext).to be_an_instance_of String
      expect(enigma2.unshift_from_ciphertext).to eq "this is a test"
    end
    
    it 'ignores special characters and is case insensitive' do
      enigma2 = Enigma.new('./lib/read2.txt', 'write.txt', '01234', '111122')
      expect(enigma2.read_file_to_string).to eq 'ThIs, mEsSaGe! "WILL" encrypt?'
      expect(enigma2.shift_to_ciphertext).to eq "bsml,kqyace n!d\"etpe\"kiglbbib?"
    end
    
    it 'can write a string to a text file' do
      enigma.write_string_to_file('this will write to file')
      require 'pry'; binding.pry
      expect(File.read('./lib/write.txt')).to eq 'this will write to file'
    end
    
    it 'can encrypt' do
      
    end

    it 'can decrypt' do

    end
  end
end