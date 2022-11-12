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
  
  def shift_to_ciphertext
    shift = Shift.new(@key.hash, @offset.hash).hash
    read_file_to_string.split('')
    loop(shift)
    require 'pry'; binding.pry
    # find letter in original array
    # change every nth letter with [n] alphabet?
    # 
  end

  # def loop(shift)
  #   message = read_file_to_string.split('')
  #   message.map.with_index {|l,i|
  #     l.rotate(shift[:A]) if (i) % 4 == 0
  #     l.rotate(shift[:B]) if (i + 1) % 4 == 0
  #     l.rotate(shift[:C]) if (i + 2) % 4 == 0
  #     l.rotate(shift[:D]) if (i + 3) % 4 == 0
  #     }
  #     require 'pry'; binding.pry
  # end
  
  def unshift_from_ciphertext
    
  end

  def write_string_to_file
    
  end

  def encrypt
    
  end
  
  def decrypt

  end
  
  def rotate_letters(shift)
    [alphabet_array.rotate(shift[:A]),
    alphabet_array.rotate(shift[:B]),
    alphabet_array.rotate(shift[:C]),
    alphabet_array.rotate(shift[:D])]
  end
end