#Класс CargoTrain (Грузовой поезд):
class CargoTrain < Train

  def initialize (number)
    super
    @type = :cargo
  end

end