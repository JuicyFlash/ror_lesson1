# frozen_string_literal: true

# Класс Train (Поезд):
require_relative 'manufacturer_company'
require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'
require_relative 'wagon'
require_relative 'route'

class Train
  include ManufacturerCompany
  include InstanceCounter
  include Validation
  include Accessors
  attr_reader :wagons, :current_station, :type, :number

  # 3 символа сначала строки, затем необязательный "-",
  # Если "-" есть, то после него обязательно должен быть символ, второй символ после "-" необязательный
  NUMBER_FORMAT = /^([a-z0-9]{3})(-[a-z0-9][a-z0-9]{1}?)?$/i.freeze

  @@instances_array = []

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    @number = number
    validate!
    @speed = 0
    @wagons = []
    @@instances_array << self
    register_instance
  end

  def self.find(number)
    @@instances_array.select { |tr| tr.number == number }[0]
  end

  def each_wagon(&block)
    wagons.each(&block)
  end

  def print_type
    case @type
    when :cargo
      'грузовой'
    when :passenger
      'пассажирский'
    else
      'не определён'
    end
  end

  # Добавление вагонов в состав
  def hook_wagon(wagon)
    self.wagon = wagon
    return unless @speed.zero? && wagon.type == @type
    self.wagon.hooked = true
    @wagons << self.wagon
  end

  def unhook_wagon(wagon)
    self.wagon = wagon
    return unless @speed.zero? && @wagons.length.positive?
    self.wagon.hooked = false
    @wagons.delete(self.wagon)
  end

  # Установка маршрута
  def set_route(route)
    self.route = route
    @current_station = self.route.stations[0]
    @current_station.recive_train(self)
  end

  # Перемещение
  # При перемещении у текущей станции трегрится команда на отправку текущего поезда,
  # а у следующей/предыдущей станции на получение
  def move_next_station
    return if next_station.nil?

    @current_station.send_train(self)
    next_station.recive_train(self)
    @current_station = next_station
  end

  def move_prev_station
    return if prev_station.nil?

    @current_station.send_train(self)
    prev_station.recive_train(self)
    @current_station = prev_station
  end

  # Следующая/предыдущая станция
  def next_station
    idx = route.stations.index(@current_station)
    route.stations[idx + 1] unless @current_station == route.last_station
  end

  def prev_station
    idx = route.stations.index(@current_station)
    route.stations[idx - 1] unless @current_station == route.first_station
  end

  protected

  strong_attr_accessor speed:Integer, wagon:Wagon, route:Route

  # Торможение до нуля
  def speed_down
    speed = 0
  end

  # Набор скорости
  def speed_up(sp)
    speed += sp
  end
end
