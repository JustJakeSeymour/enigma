class Enigma
  attr_reader :read,
              :write,
              :key,
              :offset

  def initialize(read, write, key = nil, date = nil)
    @read = read
    @write = write
    @key = Key.new(key)
    @offset = Offset.new(date)
  end

  def alphabet_array
    ('a'..'z').to_a.push(" ")
  end

  def read_file_to_string
    File.read(@read)
  end
  
  def shift_to_ciphertet
    shift = Shift.new(@key, @offset).hash
    read_file_to_string
  end
  
  def unshift_from_ciphertext
    
  end

  def write_string_to_file
    
  end

  def encrypt
    
  end
  
  def decrypt

  end
  
end