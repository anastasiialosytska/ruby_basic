product_cart = Hash.new

loop do
  puts "Введите название товара: "
  product = gets.chomp
  break if product == "стоп"
  puts "Введите цену за единицу товара: "
  price = gets.chomp.to_f
  puts "Введите количество: "
  quantity = gets.chomp.to_f

  product_cart[product] = { price: price, quantity: quantity }
end

puts product_cart

total = Array.new

product_cart.each do |product, value|
  product_sum = (value[:price] * value[:quantity]).round(2)
  total << product_sum
  puts "Стоимость товара #{product}: #{product_sum}"
end

puts "Общая сумма: #{total.sum}"
