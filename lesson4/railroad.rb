#Управляющий класс для Station, Train, Route, Van
class Railroad
  attr_reader :trains
  attr_reader :stations
  attr_reader :routes
  attr_reader :van_types
  
  def initialize
    trains = []
    stations = []
    routes = []
    van_types = [:cargo,:passanger]
  end
  
  
 end
  