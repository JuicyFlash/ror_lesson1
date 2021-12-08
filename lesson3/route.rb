#Класс Route (Маршрут):
#Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
#Может добавлять промежуточную станцию в список
#Может удалять промежуточную станцию из списка
#Может выводить список всех станций по-порядку от начальной до конечной
class Route
  def initialize (start_station, end_station)
    @start_station = start_station
	@end_station = end_station
	# Сразу делаем массив, который потом будем изменять (добавлять\удалять) - это позволит изменять маршрут у поездов, которым он уже установлен
	@route = [@start_station, @end_station]	
  end
  def add_station (station)
    #Не допускаем повторное добавление станций, в том чиле начальной и конечной
    @route.insert(@route.length - 1, station) if (@route.include?(station) == false)
  end
  def remove_station (station)
    #Удаляем станцию из маршрута. Не допускается удаление станции, если на ней находится поезд с этим маршрутом. Так же запрещаем удалять начальную и конечную станцию
    @route.delete(station) if !(station.trains.map{|tr| tr.route}.include?(self)) && ((station !=@start_station) && (station != @start_station))
  end
  def print_route
    #Выводим список всех станций по-порядку от начальной до конечной
    index = 0 
	lght = @route.length
	puts ("Маршрут:")
    @route.map{|st| 
	  print "#{st.name}(#{index+=1})" 
	  print " -> " if index < lght
	  }
	puts
  end
  def get_route
    #Возвращает весь маршрут как []
    @route
  end   
end
