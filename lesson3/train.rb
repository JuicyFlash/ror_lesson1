#Класс Train (Поезд):
#Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
#Может набирать скорость
#Может возвращать текущую скорость
#Может тормозить (сбрасывать скорость до нуля)
#Может возвращать количество вагонов
#Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
#Может принимать маршрут следования (объект класса Route). 
#При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
#Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
#Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
class Train
  attr_reader :speed
  attr_reader :vans_count
  attr_reader :current_station
  attr_reader :type
  attr_reader :route
  
  def initialize (number, type, vans_count)
    @number = number
    @type = type
    @vans_count = vans_count
    @speed = 0
  end
   
  #Торможение до нуля
  def speed_down
    @speed = 0 
  end
   
  #Набор скорости
  def speed_up (speed)
    @speed += speed
  end
   
  #Добавление вагонов в состав
  def hook_van
    vans_count += 1 if @speed == 0
  end
   
  def unhook_van
    vans_count -= 1 if (@speed == 0) && (@vans_count > 0 )
  end
   
  #Установка маршрута
  def set_route (route)
    @route = route
    @current_station = @route.stations[0]
  @current_station.recive_train(self)
  #self.recalc_stations
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
end
