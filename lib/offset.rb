require 'time'

class Offset
  attr_reader :date

  def initialize(date = nil)
    @date = date_generate(date)
  end

  def date_generate(date)
    return Time.now.strftime '%d%m%y' if date.nil?
    return date
  end
  
  def date_squared
    @date.to_i ** 2
  end
  
  def date_squared_last_four
    date_squared.to_s[-4..-1]
  end

  def hash
    {
    :A => date_squared_last_four[0].to_i,
    :B => date_squared_last_four[1].to_i,
    :C => date_squared_last_four[2].to_i,
    :D => date_squared_last_four[3].to_i,
    }
  end
end