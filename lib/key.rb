class Key
  attr_reader :key

  def initialize(key = nil)
    @key = number_generate(key)
  end

  # if I can add this into the initialize attribute, should I?
  def number_generate(key)
    return rand.to_s[2..6] if key.nil?
    return key
  end

  def hash
    {
      :A => "#{@key[0]}#{@key[1]}".to_i,
      :B => "#{@key[1]}#{@key[2]}".to_i,
      :C => "#{@key[2]}#{@key[3]}".to_i,
      :D => "#{@key[3]}#{@key[4]}".to_i
    }
  end
end