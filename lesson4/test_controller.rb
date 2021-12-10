load './station.rb'
load './train.rb'
load './route.rb'
#Массив станций
star = []
10.times{ star << Station.new("Station n_#{i+=1}")}
#Новый маршрут
route = Route.new(star[0],star[5])
route.print_route
route.add_station(star[1])
route.add_station(star[2])
route.add_station(star[3])
route.print_route
#Новый поезд
train = Train.new("nTrain1","gruz",15)
train.set_route(route)
#Проверяем что поезд на первой станции
route[0].trains
#Перемещаем станции
train.move_next_station
train.move_next_station