class PassengerWagon < Wagon

  def initialize
    super
    @type = :passenger
    @type_for_print = "пассажирский"
  end

  def self.print_type
    "Пассажирский"
  end

end