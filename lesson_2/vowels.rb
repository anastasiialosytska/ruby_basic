alphabet = ('а'..'я').to_a
vowels = ['а', 'у', 'о', 'и', 'э', 'ы', 'я', 'ю', 'е']

vowel_index = Hash.new {0}

alphabet.each do |letter|
  if vowels.include?(letter)
  	vowel_index[letter] = (alphabet.index(letter)) + 1
  end
end
puts vowel_index
