print "Введите основание треугольника (см): "

triangle_base = gets.to_i

print "Введите высоту треугольника (см): "

triangle_height = gets.to_i
triangle_square = 0.5 * triangle_height * triangle_base

puts "Площадь треугольника составляет #{triangle_square} квадратных сантиметров"
