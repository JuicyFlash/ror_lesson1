#Класс PassengerTrain (Грузовой поезд):
class PassengerTrain < Train

  @instaces = 0

  def initialize (number)
    super
    @type = :passenger
  end
end