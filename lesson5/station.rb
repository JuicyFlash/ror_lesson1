require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name
  attr_reader :trains

  def self.all
    if instances_array.length == 0
      nil
    else
      instances_array
    end

  end

  def initialize (name)
    @name = name
    @trains = []
    self.register_instance
  end
  
  def recive_train (train)
    @trains << train
  end
  
  def trains_by_type (train_type)
   @trains.select{|train| train.type == train_type}
  end
  
  def send_train (train)
    @trains.delete(train)
  end
end
