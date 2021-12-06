#6. Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
#Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
#Вычислить и вывести на экран итоговую сумму всех покупок в "корзине"
hash_items = Hash.new
loop do
  print ("Введите название товара (стоп или stop - выод): ")
  item_name = gets.chomp.to_sym
  break if (item_name.downcase == :stop) || (item_name.downcase == :стоп)
  print ("Введите количество товара: ")
  item_count = gets.chomp.to_i
  print ("Введите цену товара: ")
  item_price = gets.chomp.to_f  
  if hash_items[item_name].nil?
    hash_price = Hash.new(0)    	
  elsif
  # Если товар есть в списке, берём его старый хэш цена-количество и добавляем данные в него, ключём является цена - допускаеем возможноть покупки одного товара с разной цене 
    hash_price = hash_items[item_name]
  end   
  hash_price[item_price] += item_count  
  hash_items[item_name.to_sym] = hash_price
end
total_sum = 0
puts "Куплено товаров"
hash_items.each{|key_item, val_item|
  sum_per_item = 0
  puts "Товар #{key_item} куплено:"
  val_item.each{|key_price, val_price|
    puts "     #{val_price} едениц по цене #{key_price} всего на #{val_price * key_price}"
	sum_per_item +=val_price * key_price
  }
  puts "Итого по товару #{sum_per_item}"
  total_sum += sum_per_item
}
puts "Общая сумма покупок составила: #{total_sum}"
