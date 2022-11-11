class Shift
  attr_reader :hash

  def initialize(key, offset)
    @hash = combination(key, offset)
  end

  def combination(key, offset)
    key.merge(offset){|symbol, k, o| k + o}
  end
end