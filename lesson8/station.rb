# frozen_string_literal: true

require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :trains

  @@instances_array = []

  # Строчная буква только первая
  NAME_FORMAT = /^[A-Z0-9]{1}[a-z0-9]+$/.freeze

  def self.all
    if @@instances_array.length.zero?
      nil
    else
      @@instances_array
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
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

  protected

  def validate!
    raise 'Не задано название станции' if @name.nil?
    raise "Некорректное название станции #{NAME_FORMAT}" if @name !~ NAME_FORMAT
  end
end
