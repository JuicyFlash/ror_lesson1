class CargoWagon < Wagon


  def initialize (volume)
    @volume = volume.to_i
    @unavailable_volume = 0
    @available_volume = 0
    @type = :cargo
    @type_for_print = "грузовой"
    super
  end
  def self.print_type
    "Грузовой"
  end

  def fill_space! (param)
    take_volume! (param)
  end


  def available_space!
    available_volume
  end

  def unavailable_space!
    @unavailable_volume
  end

  protected

  def take_volume!(count)
    raise "Занимаемый объём должен бытоь больше 0" if count.to_i <= 0
    raise "Недостаточно свобоного объёма. Осталось #{available_volume}" if available_volume < count
    @unavailable_volume += count
  end
  def available_volume
     @volume - @unavailable_volume
  end

  def validate!
    super
    raise "Объём должен быть больше 0" if @volume <= 0
  end

end