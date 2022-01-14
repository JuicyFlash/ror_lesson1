# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'
class Station
  include InstanceCounter
  include Validation
  attr_reader :name, :trains

  @@instances_array = []

  # Строчная буква только первая
  NAME_FORMAT = /^[A-Z0-9]{1}[a-z0-9]+$/.freeze

  validate :name, :presence
  validate :name, :format, NAME_FORMAT

  def self.all
    if @@instances_array.length.zero?
      nil
    else
      @@instances_array
    end
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    register_instance
    @@instances_array << self
  end

  def each_train(&block)
    @trains.each(&block)
  end

  def recive_train(train)
    @trains << train
  end

  def trains_by_type(train_type)
    @trains.select { |train| train.type == train_type }
  end

  def send_train(train)
    @trains.delete(train)
  end

end
