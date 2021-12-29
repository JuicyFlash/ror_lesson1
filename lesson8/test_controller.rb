require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'railroad'

tr1 = CargoTrain.new("ss1")
tr2 = CargoTrain.new("ss2")
tr3 = CargoTrain.new("ss3")
st = Station.new ("Msc")
st.recive_train(tr1)
st.recive_train(tr2)
st.recive_train(tr3)


rr = Railroad.new
rr.load_test_data
rr.trains_report

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