#require_relative 'passenger_wagon'
class Wagon
  attr_accessor :hooked
  attr_reader :type
  attr_reader :type_for_print
  def initialize
    @hooked = false
  end
  #Запрещаем создание объекта класса Wagon
  private_class_method :new
end