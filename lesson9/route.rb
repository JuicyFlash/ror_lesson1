# frozen_string_literal: true

require_relative 'instance_counter'
class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(start_station, end_station)
    # Сразу делаем массив, который потом будем изменять (добавлять\удалять)
    @stations = [start_station, end_station]
    register_instance
  end

  def add_station(station)
    # Не допускаем повторное добавление станций, в том чиле начальной и конечной
    @stations.insert(@stations.length - 1, station) unless @stations.include?(station)
  end

  def remove_station(station)
    # Удаляем станцию из маршрута. Не допускается удаление станции, если на ней находится поезд с этим маршрутом. 
    # Так же запрещаем удалять начальную и конечную станцию
    unless station.trains.map(&:route).include?(self) && ((station != first_station) && (station != last_station))
      return
    end

    @stations.delete(station)
  end

  def print_stations
    # Выводим список всех станций по-порядку от начальной до конечной
    index = 0
    lgth = @stations.length
    #  puts ("Маршрут:")
    @stations.map do |st|
      print "#{st.name}(#{index += 1})"
      print ' -> ' if index < lgth
    end.to_s
    puts
  end

  def first_station
    # Возвращает первую станцию
    @stations[0]
  end

  def last_station
    # Возвращает последнюю станцию
    @stations[-1]
  end
end
