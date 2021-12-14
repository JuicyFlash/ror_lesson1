require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'station'
require_relative 'route'
#Управляющий класс для Station, Train, Route, Wagon
class Railroad
  attr_reader :trains
  #attr_reader :stations
  attr_reader :routes
  #attr_reader :wagons
  attr_reader :available_wagons_types
  
  def initialize
    @trains = []
    @stations = []
    @routes = []
    @wagons = []
    @available_wagons_types = [PassengerWagon,CargoWagon]
  end

  #Список типов вагонов
  def print_wagon_types
    @available_wagons_types.each { |wt| print "#{@available_wagons_types.index(wt)}. #{wt.print_type} "}
    puts
  end

  #Список вагонов
  def print_wagons
    puts "Доступные вагоны: "
    @wagons.each { |wg|
      print"#{@wagons.index(wg)}.#{wg.type_for_print} "
      print" в сотаве" if wg.hooked
      print" не в сотаве" unless wg.hooked
      puts
      }
  end

  #Добавление вагона
  def add_wagon(wag_idx)
    if !(@available_wagons_types[wag_idx].nil?)
      @wagons << @available_wagons_types[wag_idx].new
      puts "#{@available_wagons_types[wag_idx].print_type} вагон добавлен"
    elsif
      puts "Некорректно указан тип вагона"
    end
  end

  #Удаление вагона
  def remove_wagon (wag_idx)
    @wagons.delete(@wagons[wag_idx])
  end

  #Список станций
  def print_stations
    puts "Доступные станции: "
    @stations.each { |st|
      print"#{@stations.index(st)}.#{st.name} "
      puts
    }
  end

  #Добавление станции
  def add_station (param_name)
    unless  @stations.map { |st| st.name }.include?(param_name)
      @stations << Station.new(param_name)
      puts"Станция #{param_name} добавлена"
    else
      puts "Станция #{param_name} не добавлена - станция с таким названием уже есть"
    end
  end

  #Удаление станции
  def remove_station (stat_idx)
    unless @stations[stat_idx].nil?
      puts "Станция удалена #{ @stations[stat_idx].name}"
      @stations.delete(@stations[stat_idx])
    end
  end

  def print_station_trains (stat_idx)
    unless @stations[stat_idx].trains.nil?
      @stations[stat_idx].trains_by_type(:cargo).each{|tr|
      print "#{tr.number}  #{tr.print_type}"
      puts
      }
      @stations[stat_idx].trains_by_type(:passenger).each{|tr|
        print "#{tr.number}  #{tr.print_type}"
        puts
      }
    end
  end

  #Добавление поезда
  def add_train (param_type, param_number)
    @trains << CargoTrain.new(param_number) if param_type == 0
    @trains << PassengerTrain.new(param_number) if param_type == 1
  end

  #Установка маршрута поезду
  def set_route_train (route_idx, train_idx)
    @trains[train_idx].set_route(@routes[route_idx]) unless @trains[train_idx].nil? && @routes[route_idx].nil?
  end

  #Перемещение поезда
  def move_train (param_move, train_idx)
    unless @trains[train_idx].nil?
      if param_move == 0
        @trains[train_idx].move_prev_station
      elsif  param_move == 1
        @trains[train_idx].move_next_station
      end
      puts "Поезд перемещён"
    end
  end

  #Список поездов
  def print_trains
    puts "Доступные поезда: "
    @trains.each { |tr|
      print"#{@trains.index(tr)}. Номер: #{tr.number}. Тип: #{tr.print_type}. Вагонов в составе: #{tr.wagons.length}"
      puts
    }
  end
  #Список вагонов поезда
  def print_train_wagons (train_idx)
    @trains[train_idx].wagons.each{|wg|
      unless trains[train_idx].nil? && trains[train_idx].wagons.length > 0
      print "#{@wagons.index(wg)}  #{wg.type_for_print}"
      puts
      end
  }
  end

  def print_current_train_station (train_idx)
    puts "Текущая станция: #{@trains[train_idx].current_station.name}" unless @trains[train_idx].current_station.nil?
  end

  def print_next_train_station (train_idx)
    puts "Следующая станция: #{@trains[train_idx].next_station.name}" unless @trains[train_idx].next_station.nil?
  end

  def print_prev_train_station (train_idx)
    puts "Предыдущая станция: #{@trains[train_idx].prev_station.name}" unless @trains[train_idx].prev_station.nil?
  end

  #Удаление поезда
  def remove_train (train_idx)
    unless @trains[train_idx].nil?
      puts "Поезд удалён #{ @trains[train_idx].number}"
      @trains.delete(@trains[train_idx])
    end
  end

  def edit_train_hook_wagon (wagon_idx, train_idx)
    @trains[train_idx].hook_wagon(@wagons[wagon_idx]) unless @trains[train_idx].nil? && @wagons[wagon_idx].nil?
  end

  def edit_train_unhook_wagon (wagon_idx, train_idx)
    @trains[train_idx].unhook_wagon(@wagons[wagon_idx]) unless @trains[train_idx].nil? && @wagons[wagon_idx].nil?
  end

  #Добавление маршрута
  def add_route (firs_idx, last_idx)
    unless (@stations[firs_idx].nil?) && (@stations[last_idx].nil?)
      @routes << Route.new(@stations[firs_idx], @stations[last_idx])
    end
  end

  #Добавление станции в маршрут
  def edit_route_add_station (station_idx, route_idx)
    @routes[route_idx].add_station(@stations[station_idx]) unless @stations[station_idx].nil?
  end

  #Удаление станции из маршрута
  def edit_route_remove_station (station_idx, route_idx)
    @routes[route_idx].remove_station(@stations[station_idx]) unless @stations[station_idx].nil?
  end

  #Удаление маршрута
  def remove_route (route_idx)
    @routes.delete(@routes[route_idx])
  end

  #Список маршрутов
  def print_routes
    puts "Доступные маршруты: "
    @routes.each { |rt|
      print"#{@routes.index(rt)}. "
      print" #{rt.print_stations}"
      puts
    }
  end

end

  