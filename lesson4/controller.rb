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

  private

  #Главное меню
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
        # Добавление вагона
        @rr.add_wagon

      when 1
        #Список вагонов
        @rr.print_wagons

      when 2
        # Удаление вагона
        @rr.remove_wagon

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
        #Добавление поезда
        @rr.add_train

      when 1
        #Список поездов
        @rr.print_trains

      when 2
        #Установка маршрута поезду
        @rr.set_route_train

      when 3
        #Переместить поезд
        @rr.move_train

      when 4
        #Зацепить вагон
        @rr.edit_train_hook_wagon

      when 5
        #Отцепить вагон
        @rr.edit_train_unhook_wagon

      when 6
        # Удаление поезда
        @rr.remove_train

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
        #Добавление станции
        @rr.add_station

      when 1
        #Список станций
        @rr.print_stations

      when 2
        #Список поездов на станции
        @rr.print_station_trains

      when 3
        # Удаление станции
        @rr.remove_station

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
        #Добавление маршрута
        @rr.add_route

      when 1
        #Список маршрутов
        @rr.print_routes

      when 2
        #Добавление станции в маршрут
        @rr.edit_route_add_station

      when 3
        #Удаление станции из маршрута
        @rr.edit_route_remove_station

      when 4
        # Удаление маршрута
        @rr.remove_route

      else
        break
      end
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