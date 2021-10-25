print "Как Вас зовут? "

name = gets.chomp
name.capitalize!

print "#{name}, какой у вас рост? "

height = gets.chomp.to_i

ideal_weight = (height - 110) * 1.15


if ideal_weight > 0
  puts "#{name}, Ваш идеальный вес #{ideal_weight.round(1)} кг"
else
  puts "Ваш вес уже оптимальный"
end


