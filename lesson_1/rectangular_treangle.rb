print "Задайте сторону a = "
a = gets.chomp.to_f
print "Задайте сторону b = "
b = gets.chomp.to_f
print "Задайте сторону c = "
c = gets.chomp.to_f
#определяем самую длинную сторону
if (a > b) && (a > c)
  is_rectangular = a**2 == (b**2 + c**2)
elsif (b > a) && (b > c)
  is_rectangular = b**2 == (a**2 + c**2)
elsif (c > a) && (c > b)
  is_rectangular = c**2 == (b**2 + a**2)
end

if (a == b) && (b == c)
  puts "Треугольник со сторонами a=#{a} b=#{b} c=#{c} равносторонний"
elsif (a==b) || (b == c) || (c == a) 
  print "Треугольник со сторонами a=#{a} b=#{b} c=#{c} равнобедренный"  
  puts " и прямоугольный" if is_rectangular
  puts if !is_rectangular
elsif is_rectangular
  puts "Треугольник со сторонами a=#{a} b=#{b} c=#{c} прямоугольный"  
elsif !is_rectangular
<<<<<<< HEAD
  puts "Треугольник со сторонами a=#{a} b=#{b} c=#{c} не является прямоугольным, равнобедренным, или равносторонним" 
end
=======
<<<<<<<< HEAD:lesson_1/rectangular_treangle.rb
puts "Треугольник со сторонами a=#{a} b=#{b} c=#{c} не является прямоугольным, равнобедренным, или равносторонним" 
end
========
  puts "Треугольник со сторонами a=#{a} b=#{b} c=#{c} не является прямоугольным, равнобедренным, или равносторонним" 
end
>>>>>>>> 65175eacc8958313ec6fa6ef8092ae541c6e4784:rectangular_treangle.rb
>>>>>>> 65175eacc8958313ec6fa6ef8092ae541c6e4784
