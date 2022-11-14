class Key
  attr_reader :key

  def initialize(key = nil)
    @key = number_generate(key)
  end

  def number_generate(key)
    rand.to_s[2..6] if key.nil?
    remove_and_pad(key)
  end

  def remove_and_pad(key)
    key.to_s.tr('^0-9', '').rjust(5, '0')[-5..]
  end

  def hash
    {
      A: "#{@key[0]}#{@key[1]}".to_i,
      B: "#{@key[1]}#{@key[2]}".to_i,
      C: "#{@key[2]}#{@key[3]}".to_i,
      D: "#{@key[3]}#{@key[4]}".to_i
    }
  end
end
