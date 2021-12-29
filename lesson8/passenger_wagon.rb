class PassengerWagon < Wagon

  def initialize (seats)
    @type = :passenger
    @type_for_print = "пассажирский"
    super
  end

  def fill_space
    if @total_space > unavailable_space
      @unavailable_space += 1
    else
      raise "Заняты все места"
    end
  end

  protected

  def validate!
    super
    raise "Количестов мест должно быть больше 0" if @total_space <= 0
  end
end