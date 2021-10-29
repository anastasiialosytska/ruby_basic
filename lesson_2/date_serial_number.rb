puts "Введите число: "
date = gets.chomp.to_i

puts "Введите месяц: "
month = gets.chomp.to_i

puts "Введите год: "
year = gets.chomp.to_i

quantity_of_days = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }
quantity_of_days[2] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0

sum = 0
quantity_of_days.select! { |m, days| m < month}.values
quantity_of_days.each { |m, days| sum += days }

date_serial_number = sum + date

puts "Порядкоый номер даты: #{date_serial_number}"
