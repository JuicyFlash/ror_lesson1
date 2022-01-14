# frozen_string_literal: true

class PassengerWagon < Wagon
  def initialize(seats)
    @type = :passenger
    @type_for_print = 'пассажирский'
    super
  end

  def fill_space
    raise 'Заняты все места' unless @total_space > unavailable_space

    @unavailable_space += 1
  end

  protected

  def validate!
    super
    raise 'Количестов мест должно быть больше 0' if @total_space <= 0
  end
end
