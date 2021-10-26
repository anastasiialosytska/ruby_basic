puts "Введите первый коэффициент:"

first_coefficient = gets.to_f

puts "Введите второй коэффициент:"

second_coefficient = gets.to_f

puts "Введите третий коэффициент:"

third_coefficient = gets.to_f
discriminant = (second_coefficient ** 2) - (4 * first_coefficient * third_coefficient)

if discriminant > 0
  first_root = (-second_coefficient + Math.sqrt(discriminant)) / (2 * first_coefficient)
  second_root = (-second_coefficient - Math.sqrt(discriminant)) / (2 * first_coefficient)
  puts "D = #{discriminant}
  Х1 = #{first_root.round(4)}
  X2 = #{second_root.round(4)}"
elsif discriminant == 0
  root = (-second_coefficient) / (2 * first_coefficient)
  puts "D = #{discriminant}
  X1 = X2 = #{root.round(4)}"
elsif discriminant < 0
  puts "D = #{discriminant}, корней нет"
end
  	