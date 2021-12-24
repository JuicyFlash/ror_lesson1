#require_relative 'passenger_wagon'
require_relative 'manufacturer_company'
class Wagon
  include ManufacturerCompany
  attr_accessor :hooked
  attr_reader :type
  attr_reader :type_for_print

  def initialize (param)
    validate!
    @hooked = false
  end

  def fill_space!
    raise "У нетипизированных вагонов данный метод недоступен"
  end

  def unavailable_space!
    raise "У нетипизированных вагонов данный метод недоступен"
  end

  def available_space!
    raise "У нетипизированных вагонов данный метод недоступен"
  end

  protected
  def validate!
    raise "Запрещено создавать вагоны неопределённого типа" if self.class == Wagon
  end

end