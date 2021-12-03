<<<<<<< HEAD
puts "Как вас зовут?"
name =  gets.chomp.capitalize
puts "Укажите свой рост"
height = gets.chomp.to_i
perfect_weight = (height - 110) * 1.15
if perfect_weight > 0
  puts "#{name}, Ваш оптимальный вес #{perfect_weight}"
else
  puts "#{name}, Ваш вес уже оптимальный."
end
=======
puts "Как вас зовут?"
name =  gets.chomp.capitalize
puts "Укажите свой рост"
height = gets.chomp.to_i
perfect_weight = (height - 110) * 1.15
if perfect_weight > 0
  puts "#{name}, Ваш оптимальный вес #{perfect_weight}"
else
<<<<<<<< HEAD:lesson_1/perfect_weight.rb
puts "#{name}, Ваш вес уже оптимальный."
end
========
  puts "#{name}, Ваш вес уже оптимальный."
end
>>>>>>>> 65175eacc8958313ec6fa6ef8092ae541c6e4784:perfect_weight.rb
>>>>>>> 65175eacc8958313ec6fa6ef8092ae541c6e4784
