class PassengerWagon < Wagon

  def initialize (seats)
    @seats = seats.to_i
    @unavailable_seats = 0
    @type = :passenger
    @type_for_print = "пассажирский"
    super
  end

  def self.print_type
    "Пассажирский"
  end

  def fill_space!
    take_seat!
  end

  def available_space!
    available_seats
  end

  def unavailable_space!
    @unavailable_seats
  end

  protected

  def take_seat!
    if @seats > @unavailable_seats
      @unavailable_seats += 1
    else
      raise "Заняты все места"
    end
  end

  def available_seats
    @seats - @unavailable_seats
  end
  def validate!
    super
    raise "Количестов мест должно быть больше 0" if @seats <= 0
  end


end