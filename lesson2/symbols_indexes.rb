#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1)
source_string = ('а'..'я').to_a
source_string.insert(source_string.index{|x| x=="ж"}, "ё")
result_hash = Hash.new
symbols_string = "аиеёоуыэюя"
for i in 0 .. symbols_string.length
  result_hash[symbols_string[i].to_sym] = source_string.index(symbols_string[i])+1 unless source_string.index(symbols_string[i]).nil?   
end
result_hash.each{|smb, ind| puts "#{smb} - #{ind}"} 