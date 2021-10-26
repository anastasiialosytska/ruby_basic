puts "Введите длину первой стороны (см):"

first_triangle_side = gets.to_i

puts "Введите длину второй стороны (см):"

second_triangle_side = gets.to_i

puts "Введите длину третьей стороны (см):"

third_triangle_side = gets.to_i

if (first_triangle_side == second_triangle_side) && (second_triangle_side == third_triangle_side)
  puts "Треугольник равносторонний"
elsif (first_triangle_side ** 2 == (second_triangle_side ** 2) + (third_triangle_side ** 2)) || (second_triangle_side ** 2 == (first_triangle_side ** 2) + (third_triangle_side ** 2)) || (third_triangle_side ** 2 == (first_triangle_side ** 2) + (second_triangle_side ** 2))
  puts "Треугольник прямоугольный"
elsif (first_triangle_side == second_triangle_side) || (first_triangle_side == third_triangle_side) || (second_triangle_side == third_triangle_side)
  puts "Треугольник равнобедренный"
else
  puts "Это обычный треугольник"
end
