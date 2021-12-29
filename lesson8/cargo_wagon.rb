class CargoWagon < Wagon

  def initialize (volume)
    @type = :cargo
    @type_for_print = "грузовой"
    super
  end

  def fill_space (count)
    raise "Занимаемый объём должен бытоь больше 0" if count.to_i <= 0
    raise "Недостаточно свобоного объёма. Осталось #{available_space}" if available_space < count
    @unavailable_space += count
  end

  protected

  def validate!
    super
    raise "Объём должен быть больше 0" if @total_space <= 0
  end
end