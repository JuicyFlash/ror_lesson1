#require_relative 'passenger_wagon'
require_relative 'manufacturer_company'
class Wagon
  include ManufacturerCompany
  attr_accessor :hooked
  attr_reader :type
  attr_reader :type_for_print
  def initialize
    @hooked = false
  end
end