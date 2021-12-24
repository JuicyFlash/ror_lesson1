#Класс Train (Поезд):
require_relative 'manufacturer_company'
require_relative 'instance_counter'

class Train

  include ManufacturerCompany
  include InstanceCounter

  attr_reader :speed
  attr_reader :wagons
  attr_reader :current_station
  attr_reader :type
  attr_reader :route
  attr_reader :number
  # 3 символа сначала строки, затем необязательный "-",
  # Если "-" есть, то после него обязательно должен быть символ, второй символ после "-" необязательный
  NUMBER_FORMAT = /^([a-z0-9]{3})(\-[a-z0-9]{1}[a-z0-9]{1}?)?$/i

  @@instances_array = []

  def initialize (number)
    @number = number
    validate!
    @speed = 0
    @wagons = []
    @@instances_array << self
    self.register_instance
  end

  def valid?
    validate!
  rescue RuntimeError => e
    puts e.message
    false
  end

  def self.find (number)
    @@instances_array.select { |tr| tr.number == number }[0]
  end

  def each_wagon
    wagons.each { |wg| yield(wg) }
  end

  def print_type
    if @type == :cargo
      "грузовой"
    elsif  @type == :passenger
      "пассажирский"
    end
  end


   
  #Добавление вагонов в состав
  def hook_wagon (wagon)
    if (@speed == 0) && (wagon.type == @type)
      wagon.hooked = true
      @wagons << wagon
    end

  end
   
  def unhook_wagon(wagon)
    if (@speed == 0) && (@wagons.length > 0 )
      wagon.hooked = false
      @wagons.delete(wagon)
    end

  end
   
  #Установка маршрута
  def set_route (route)
    @route = route
    @current_station = @route.stations[0]
    @current_station.recive_train(self)
  end
   
  #Перемещение    
  #При перемещении у текущей станции трегрится команда на отправку текущего поезда, а у следующей/предыдущей станции на получение 
  def move_next_station
    unless self.next_station.nil?
      @current_station.send_train(self)
      self.next_station.recive_train(self)
      @current_station = self.next_station
    end
  end
   
  def move_prev_station
    unless self.prev_station.nil?
      @current_station.send_train(self)
      self.prev_station.recive_train(self)
      @current_station = self.prev_station
    end
  end
   
  #Следующая/предыдущая станция
  def next_station
    idx = @route.stations.index(@current_station)
    @route.stations[idx + 1] unless @current_station == @route.last_station
  end
   
  def prev_station
    idx = @route.stations.index(@current_station)
    @route.stations[idx - 1] unless @current_station == @route.first_station
  end

  protected
  #Методы ниже перенесены в protected
  # кмк управление скоростью должно быть инкапсулировано в классе поезд (вероятно переопределены в наследниках)
  # и зависеть от параметров (тип поезда, ограничение скорости на перегоне итд)
  def validate!
    raise "Не задан номер поезда" if number.nil?
    raise "Номер поезда не может быть короче 3х символов" if number.length < 3
    raise "Некореектно задан формат номера #{NUMBER_FORMAT}" if number !~ NUMBER_FORMAT
    true
  end

  #Торможение до нуля
  def speed_down
    @speed = 0
  end

  #Набор скорости
  def speed_up (speed)
    @speed += speed
  end
end
