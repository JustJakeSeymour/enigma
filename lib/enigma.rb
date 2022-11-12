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

  def read_file_to_string

  end
  
  def shift_to_ciphertet

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