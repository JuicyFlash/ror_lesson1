require_relative 'railroad'
class Controller
  attr_accessor :rr
  def initialize
    @rr = Railroad.new
  end

  def start
    loop do
      main_menu
    end
  end

  def main_menu
    puts
    puts "-------------------------------"
    puts "Выберите объекты для управления"
    puts "0. Вагоны"
    puts "1. Поезда"
    puts "2. Станции"
    puts "3. Маршруты"
    puts "4. Выход"
    menu_select = gets.chomp.to_i
    case menu_select

      #Меню вагонов
    when 0
      wagon_menu

      #Мню поездов
    when 1
      train_menu

      #Мею станций
    when 2
      station_menu

      #Меню маршрутов
    when 3
      route_menu
    else
      exit
    end
  end
  #Описание меню вагонов
  def wagon_menu
    loop do
      puts
      puts "-----------------"
      puts "Выберите действие"
      puts "0. Добавить"
      puts "1. Список вагонов"
      puts "2. Удалить"
      puts "3. Отмена"
      menu_select = gets.chomp.to_i
      case menu_select

      when 0
        action_menu_add(:wagon)

      when 1
        action_menu_print(:wagons)

      when 2
        action_menu_remove(:wagon)

      else
        break
      end
    end
  end

  #Описание меню поездов
  def train_menu
    loop do
      puts
      puts "-----------------"
      puts "Выберите действие"
      puts "0. Добавить"
      puts "1. Список поездов"
      puts "2. Установить маршрут поезду"
      puts "3. Переместить поезд"
      puts "4. Добавить вагон в состав"
      puts "5. Убрать вагон из состава"
      puts "6. Удалить поезд"
      puts "7. Отмена"
      menu_select = gets.chomp.to_i
      case menu_select

      when 0
        action_menu_add(:train)

      when 1
        action_menu_print(:trains)

      when 2
      action_menu_edit(:train_set_route)

      when 3
      action_menu_edit(:train_move)

      when 4
      action_menu_edit(:train_hook_wagon)

      when 5
      action_menu_edit(:train_unhook_wagon)

      when 6
      action_menu_remove(:train)

      else
        break
      end
    end
  end

  #Описание меню станций
  def station_menu
    loop do
      puts
      puts "-----------------"
      puts "Выберите действие"
      puts "0. Добавить"
      puts "1. Список станций"
      puts "2. Список поездов на станций"
      puts "3. Удалить"
      puts "4. Отмена"
      menu_select = gets.chomp.to_i
      case menu_select

      when 0
        action_menu_add(:station)

      when 1
        action_menu_print(:stations)

      when 3
        # Удалить станцию
        action_menu_remove(:station)

      else
        break
      end
    end
  end

  #Описание меню маршрутов
  def route_menu
    loop do
      puts
      puts "-----------------"
      puts "Выберите действие"
      puts "0. Добавить"
      puts "1. Список маршрутов"
      puts "2. Изменить (добавить станцию в маршрут)"
      puts "3. Изменить (удалить станцию из маршрута)"
      puts "4. Удалить мартшрут"
      puts "5. Отмена"
      menu_select = gets.chomp.to_i
      case menu_select

      when 0
        #Добавить маршрут
        action_menu_add(:route)

      when 1
        #Вывести маршруты
        action_menu_print(:routes)

      when 2
        action_menu_edit (:route_add_station)

      when 3
        action_menu_edit (:route_remove_station)

      when 4
        # Удалить маршрут
        action_menu_remove(:route)

      else
        break
      end
    end
  end

  #Обобщающее меню добавления объектов
  def action_menu_add (idx)
    case idx

    when :wagon
      # Добавление вагона
      puts
      print "Укажите типа вагона:   #{@rr.print_wagon_types} "
      param_type = gets.chomp.to_i
      @rr.add_wagon(param_type)

    when :train
      #Добавление поезда
      print "Укажите типа поезда 0 - грузовой 1 - пассажирский: "
      param_type = gets.chomp.to_i
      puts
      print "Задайте номер поезда: "
      param_number = gets.chomp
      @rr.add_train(param_type, param_number)

    when :station
      #Добавление станции
      puts
      print "Введите название станции: "
      param_name = gets.chomp
      @rr.add_station(param_name)

    when :route
      #Добавление маршрута
      puts "Задайте начальную и конечную станцию маршрута"
      action_menu_print(:stations)
      print "Начальная станция:  "
      param_first = gets.chomp.to_i
      print "Конечная станция:  "
      param_last = gets.chomp.to_i
      @rr.add_route(param_first, param_last)
    end
  end

  #Обобщающее меню вывода существующих объектов
  def action_menu_print (idx)

    case idx

    when :wagons
      #Список вагонов
      @rr.print_wagons

    when :trains
      #Список поездов
      @rr.print_trains

    when :stations
      #Список станций
      @rr.print_stations

    when :routes
      #Список маршрутов
      @rr.print_routes
    when  :stations_train
      puts "Выберите станцию"
      @rr.print_stations
      param_station = gets.chomp.to_i
      @rr.print_station_trains(param_station)

    end
  end

  #Обобщающее меню удаления объектов
  def action_menu_remove (idx)
    case idx

    when :wagon
      # Удаление вагона
      # puts "Доступные вагоны"
      action_menu_print(:wagons)
      print "Выберите вагон: "
      param_wagon = gets.chomp.to_i
      @rr.remove_wagon(param_wagon)

    when :train
      # Удаление поезда
      puts "Выберите поезд для удаления"
      action_menu_print(:trains)
      param_train = gets.chomp.to_i
      @rr.remove_train(param_train)

    when :station
      # Удаление станций
      #   puts "Доступные станции"
      action_menu_print(:stations)
      print "Выберите станцию: "
      param_station = gets.chomp.to_i
      @rr.remove_station(param_station)

    when :route
      # Удаление маршрута
      action_menu_print(:routes)
      print "Выберите маршрут: "
      param_route = gets.chomp.to_i
      @rr.remove_route(param_route)
    end

  end

  #Обобщающее меню изменения объектов
  def action_menu_edit (idx)

    case idx

    when :train_hook_wagon
      puts "Выберите поезд"
      action_menu_print(:trains)
      param_train = gets.chomp.to_i
      puts "Выберите вагон"
      action_menu_print(:wagons)
      param_wagon = gets.chomp.to_i
      @rr.edit_train_hook_wagon(param_wagon, param_train)

    when :train_unhook_wagon
      puts "Выберите поезд"
      action_menu_print(:trains)
      param_train = gets.chomp.to_i
      puts "Выберите вагон"
      @rr.print_train_wagons(param_train)
      param_wagon = gets.chomp.to_i
      @rr.edit_train_unhook_wagon(param_wagon, param_train)

    when :train_move
      puts "Выберите поезд"
      action_menu_print(:trains)
      param_train = gets.chomp.to_i
      puts "0 - переместить на предыдущую стануию 1 - переместить на следующую станцию"
      @rr.print_prev_train_station(param_train)
      @rr.print_current_train_station(param_train)
      @rr.print_next_train_station(param_train)
      puts
      param_moving = gets.chomp.to_i
      @rr.move_train(param_moving,param_train)
    when :train_set_route
      puts "Выберите поезд"
      action_menu_print(:trains)
      param_train = gets.chomp.to_i
      puts "Выберите маршрут"
      action_menu_print(:routes)
      param_route = gets.chomp.to_i
      @rr.set_route_train(param_route, param_train)


    when :route_add_station
      puts "Выберите маршрут"
      action_menu_print(:routes)
      param_route = gets.chomp.to_i
      puts "Выберите станцию для добавления"
      action_menu_print(:stations)
      param_station = gets.chomp.to_i
      @rr.edit_route_add_station(param_station, param_route)

    when :route_remove_station
      puts "Выберите маршрут"
      action_menu_print(:routes)
      param_route = gets.chomp.to_i
      puts "Выберите станцию для удаления"
      action_menu_print(:stations)
      param_station = gets.chomp.to_i
      @rr.edit_route_remove_station(param_station, param_route)

    end
  end

end


=begin Загрузка тестовых данных
ctrl = Controller.new
10.times{ctrl.rr.add_wagon(0)}
10.times{ctrl.rr.add_wagon(1)}
ctrl.rr.add_train(0,"num1")
ctrl.rr.add_train(1,"num2")
ctrl.rr.add_train(0,"num3")
ctrl.rr.add_station("Moscow")
ctrl.rr.add_station("st Pitesburg")
ctrl.rr.add_station("Tula")
ctrl.rr.add_station("Vologda")
ctrl.rr.add_station("Tbilisi")
ctrl.rr.add_station("Rjev")
ctrl.rr.add_route(0,5)
ctrl.rr.add_route(2,4)
ctrl.rr.edit_route_add_station(1,0)
ctrl.rr.edit_route_add_station(2,0)
ctrl.rr.edit_route_add_station(3,1)
ctrl.rr.edit_route_add_station(1,1)
ctrl.start
=end

#rr.print_wagon_types
#puts rr.available_wagons_types.length
#rr.add_wagon(0)
#rr.add_wagon(0)
#rr.add_wagon(1)
#rr.add_wagon(1)
#item_price = gets.chomp.to_f