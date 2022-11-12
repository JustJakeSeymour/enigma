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
    message = read_file_to_string.downcase.split('')
    new_string = replace_all(message, rotate_forwards(shift))
    new_string.join('')
  end
  
  def unshift_from_ciphertext
    shift = Shift.new(@key.hash, @offset.hash).hash
    message = read_file_to_string.split('')
    new_string = replace_all(message, rotate_backwards(shift))
    new_string.join('')
  end
  
  # not directly tested
  def replace_all(message, rotation)
    message.map.with_index {|l,i|
    if (i) % 4 == 0  
      replace(l, rotation[0])
    elsif (i + 1) % 4 == 0
      replace(l, rotation[1]) 
    elsif (i + 2) % 4 == 0  
      replace(l, rotation[2]) 
    else
      replace(l, rotation[3]) if (i + 3) % 4 == 0
    end}
  end

  # not directly tested
  def replace(letter, array)
    return letter if !included_letter?(letter)
    array[alphabet_array.find_index(letter)] if included_letter?(letter)
  end
  
  # not directly tested
  def included_letter?(letter)
    alphabet_array.any?{|position| position == letter}
  end

  def write_string_to_file(text)
    File.write(@write, text)
  end

  def encrypt
    write_string_to_file(shift_to_ciphertext)
  end
  
  def decrypt
    write_string_to_file(unshift_from_ciphertext)
  end
  
  def rotate_forwards(shift)
    [alphabet_array.rotate(shift[:A]),
     alphabet_array.rotate(shift[:B]),
     alphabet_array.rotate(shift[:C]),
     alphabet_array.rotate(shift[:D])]
  end

  def rotate_backwards(shift)
    [alphabet_array.rotate(- shift[:A]),
     alphabet_array.rotate(- shift[:B]),
     alphabet_array.rotate(- shift[:C]),
     alphabet_array.rotate(- shift[:D])]
  end

end