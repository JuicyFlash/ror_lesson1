puts "Как вас зовут?"
name =  gets.chomp.capitalize
puts "Укажите свой рост"
height = gets.chomp.to_i
perfect_weight = (height - 110) * 1.15
if perfect_weight > 0
  puts "#{name}, Ваш оптимальный вес #{perfect_weight}"
else
  puts "#{name}, Ваш вес уже оптимальный."
endы