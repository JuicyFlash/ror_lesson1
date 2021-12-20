module InstanceCounter

  def self.included (base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

   module ClassMethods

     def instances_array
       @@instances_array ||= []
     end

     def instances
       @instances ||= 0
     end

     def add_instance (obj)
       @instances = instances + 1
       instances_array << obj
     end

   end

   module  InstanceMethods

     private

     def register_instance
       self.class.add_instance (self)
     end

   end
 end