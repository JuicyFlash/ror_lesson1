require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'

st2 = Station.new ("ns")
st1 = Station.new("nums")

#puts "Все объекты"
#ObjectSpace.each_object()

tr = Train.new("tr3-")
tr2 = Train.new("tr2")
tr3 = PassengerTrain.new("tr3")
tr4 = CargoTrain.new("tr5")

puts Train.instances
puts PassengerTrain.instances

puts [Train].include?(tr3.class)



#CargoTrain.prt


#puts Train.instances
#puts Train.find("tr1").number
#Массив станций
#

#star = []
#10.times{ star << Station.new("Station n_#{i+=1}")}
#Новый маршрут
#route = Route.new(star[0],star[5])
#route.print_route
#route.add_station(star[1])
#route.add_station(star[2])
#route.add_station(star[3])
#route.print_route
#Новый поезд
#train = Train.new("nTrain1","gruz",15)
#train.set_route(route)
#Проверяем что поезд на первой станции
#route[0].trains
#Перемещаем станции
#train.move_next_station
#train.move_next_station