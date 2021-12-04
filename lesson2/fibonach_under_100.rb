#3. Заполнить массив числами фибоначчи до 100
m = [0,1]
loop do
  msize = m.size
  break if  m[msize - 1]+m[msize - 2] > 100
  m.push(m[msize - 1]+m[msize - 2])
end
puts m