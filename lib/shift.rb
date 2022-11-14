class Shift
  attr_reader :hash

  def initialize(key, offset)
    @hash = combination(key, offset)
  end

  def combination(key, offset)
    key.merge(offset) { |symbol, k, o| k + o }
  end

  def alphabet_array
    ('a'..'z').to_a.push(' ')
  end

  def rotate_forwards
    [alphabet_array.rotate(@hash[:A]),
     alphabet_array.rotate(@hash[:B]),
     alphabet_array.rotate(@hash[:C]),
     alphabet_array.rotate(@hash[:D])]
  end

  def rotate_backwards
    [alphabet_array.rotate(-@hash[:A]),
     alphabet_array.rotate(-@hash[:B]),
     alphabet_array.rotate(-@hash[:C]),
     alphabet_array.rotate(-@hash[:D])]
  end
end
