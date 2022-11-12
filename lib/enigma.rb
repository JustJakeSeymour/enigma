class Enigma
  attr_reader :read,
              :write,
              :key,
              :date

  def initialize(read, write, key = nil, date = nil)
    @read = read
    @write = write
    @key = Key.new(key)
    # @date = 
    
  end
  
end