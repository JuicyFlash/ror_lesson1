#require_relative 'passenger_wagon'
class Wagon
  attr_accessor :hooked 
  def initialize    
    set_type
  end  
  attr_accessor :type
  private
  def set_type    
  end
end
class PassengerWagon < Wagon    
  def set_type
    @type = :xxx
  end
end