# frozen_string_literal: true

# require_relative 'passenger_wagon'
require_relative 'manufacturer_company'
class Wagon
  include ManufacturerCompany
  attr_reader :unavailable_space, :type, :type_for_print
  attr_accessor :hooked

  def initialize(param)
    @total_space = param.to_i
    validate!
    @unavailable_space = 0
    @hooked = false
  end

  def fill_space
    raise 'У нетипизированных вагонов данный метод недоступен'
  end

  def available_space
    @total_space - unavailable_space
  end

  protected

  def validate!
    raise 'Запрещено создавать вагоны неопределённого типа' if instance_of?(Wagon)
  end
end
