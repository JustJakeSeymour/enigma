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
  
  
  
end