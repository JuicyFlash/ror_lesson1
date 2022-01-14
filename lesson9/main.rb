# frozen_string_literal: true

# Класс Main реализующий запуск приложения
require_relative 'controller'
class Main
  controller = Controller.new
  controller.start
end
