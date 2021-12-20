module InstanceCounter

  def self.included (base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

   module ClassMethods

     def instances
       @instaces
     end

     def add_instance
       @instaces += 1
     end

   end

   module  InstanceMethods

     private

     def register_instance
       self.class.add_instance
     end

   end
 end