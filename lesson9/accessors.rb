# frozen_string_literal: true
module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*params)
      params.each do |pr|

        #Сеттер
        define_method("#{pr}=".to_sym, lambda { |val|
                                         instance_eval ("@#{pr}_history||=[]
                                                              @#{pr}_history << #{val}")
                                         instance_variable_set("@#{pr}", val) })

        #Геттер
        define_method(pr.to_s.to_sym, -> { instance_variable_get("@#{pr}") })

        #История
        define_method("#{pr}_history".to_sym, -> { instance_variable_get("@#{pr}_history")})
      end
    end

    def strong_attr_accessor(params = {})
      params.each_pair do |key, key_class|

        #Сеттер
        define_method("#{key}=", lambda { |val|
          raise ("Тип значения #{val} (#{val.class}) не соответствует типу атрибута #{key_class}") unless val.kind_of?(key_class)
          instance_variable_set("@#{key}", val) })

        #Геттер
        define_method(key.to_s.to_sym, -> { instance_variable_get("@#{key}") })
      end
    end
  end
end
