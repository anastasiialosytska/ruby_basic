array = (10..100).to_a

array.select! { |element| element % 5 == 0 }

puts array

