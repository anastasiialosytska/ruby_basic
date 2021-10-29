alphabet = ('а'..'я').to_a
vowels = ['а', 'у', 'о', 'и', 'э', 'ы', 'я', 'ю', 'е']

vowel_index = Hash.new {0}

alphabet.each.with_index(1) { |element, index| vowel_index[element] = index if vowels.include?(element) }

puts vowel_index
