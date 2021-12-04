#5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
#Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде Date
month = 
{
  1 => 31,#January
  2 => 28,#February
  3 => 31,#March
  4 => 30,#April
  5 => 31,#May
  6 => 30,#June
  7 => 31,#July
  8 => 31,#August
  9 => 30,#September
  10 => 31,#October
  11 => 30,#November
  12 => 31#December
}
print "Введите число = "
user_day = gets.chomp.to_i
print "Введите месяц = "
user_month = gets.chomp.to_i
#Небольшая проверка на корректность введённых значений (год не включаем, тк не ломает вычисления)
if (month[user_month].nil?) || (month[user_month] < user_day) || (user_day <= 0) || (user_month <= 0)
  puts "Месяц или число заданы некорректно"
  exit
end
print "Введите год = "
user_year = gets.chomp.to_i
#Вычмсляем високосный год и переопределяем количество дней в феврале
if ((user_year.to_s[-1] == "0") && (user_year.to_s[-2] == "0")) && (user_year % 400 == 0)
  month[2] = 29
elsif user_year % 4 == 0
  month[2] = 29
end
#Вычисляем сумму всех дней месяцев до указанного - порядковый номер
total_index = 0
month.select{|x,y| x < user_month}.each{|m_index, d_index| total_index += d_index}
puts "Порядковый номер числа в году = #{total_index + user_day}"
