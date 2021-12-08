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
   attr_reader :route
   attr_reader :current_station
   attr_reader :train_type
#  attr_reader :next_station геттер переопределён
#  attr_reader :prev_station
   
   def initialize (train_number, train_type, vans_count)
     @train_number = train_number
	 @train_type = train_type
	 @vans_count = vans_count
     @speed = 0	 
   end
   # Торможение до нуля
   def speed_down     
	@speed = 0 
   end
   # Набор скорости
   def speed_up (speed)
    @speed += speed
   end
   # Добавление вагонов в состав
   def hook_van
     vans_count += 1 if @speed == 0
   end
   
   def unhook_van
     vans_count -= 1 if (@speed == 0) && (@vans_count > 0 )
   end
   # Установка маршрута
   def set_route (route)
    @route = route.get_route
    @current_station = @route[0]
	@current_station.recive_train(self)
	self.recalc_stations
   end
   # Перемещение 
   # Когда поезд находится в конечной/начальной станции текущая станция = следующая/предыдущая станция
   # При перемещении у текущей станции трегрится команда на отправку текущего поезда, а у следующей/предыдущей станции на получение
   # Перерасчёт станций до перемещения, атк как маршрут мог измениться
   # Перерасчёт станций после перемещения 
   def move_next_station
     if @route.index(@current_station) < @route.length
	   self.recalc_stations	
       @current_station.send_train(self)
	   @next_station.recive_train(self)
       @current_station = @route[@route.index(@current_station) + 1]
       self.recalc_stations	   
	 end
   end   
   def move_prev_station
     if @route.index(@current_station) > 0
	   self.recalc_stations	
       @current_station.send_train(self)
	   @prev_station.recive_train(self)
       @current_station = @route[@route.index(@current_station) - 1]
       self.recalc_stations	   
	 end     
   end
   def recalc_stations   
   # Вспомогательная функия - вычисляет следующую и предыдущую станцию в маршруте
     idx = @route.index(@current_station)
	 @next_station = @route[idx + 1] if idx < @route.length 
     @next_station = current_station if @route.index(@current_station) == @route.length
	 
	 @prev_station = @route[@route.index(@current_station) - 1] if @route.index(@current_station) > 0	
	 @prev_station = @current_station if @route.index(@current_station) == 0	 
	 
   end
   def next_station
     self.recalc_stations
	 @next_station
   end
   def prev_station
     self.recalc_stations
	 @prev_station
   end   
 end
