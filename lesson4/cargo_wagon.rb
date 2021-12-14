class CargoWagon < Wagon

  def initialize
    super
    @type = :cargo
    @type_for_print = "грузовой"
  end

  def self.print_type
    "Грузовой"
  end

  public_class_method :new
end