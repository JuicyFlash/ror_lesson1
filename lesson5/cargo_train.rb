#Класс CargoTrain (Грузовой поезд):
class CargoTrain < Train

  @instaces = 0

  def initialize (number)
    super
    @type = :cargo
  end

end