path = APP_ROOT.join('db', 'pokemon.txt')
file = File.open(path, 'r')

file.each do |line|
  line.chomp!
  Pokemon.create!(name: line)
end


Deck.create!(title: "Poke-Addition!", complete: false, legendary_pokemon_id: 145)

Card.create!(question: "1 + 1 = ?", answer: "2", pokemon_id: 16, deck_id: 1)
Card.create!(question: "2 + 2 = ?", answer: "4", pokemon_id: 10, deck_id: 1)
Card.create!(question: "2 + 1 = ?", answer: "3", pokemon_id: 13, deck_id: 1)
Card.create!(question: "5 + 3 = ?", answer: "8", pokemon_id: 19, deck_id: 1)
Card.create!(question: "8 + 2 = ?", answer: "10", pokemon_id: 63, deck_id: 1)
Card.create!(question: "6 + 3 = ?", answer: "9", pokemon_id: 120, deck_id: 1)
Card.create!(question: "7 + 5 = ?", answer: "12", pokemon_id: 41, deck_id: 1)
Card.create!(question: "8 + 7 = ?", answer: "15", pokemon_id: 54, deck_id: 1)
Card.create!(question: "9 + 5 = ?", answer: "14", pokemon_id: 74, deck_id: 1)
Card.create!(question: "3 + 10 = ?", answer: "13", pokemon_id: 66, deck_id: 1)

Deck.create!(title: "Poke-Subtraction!", complete: false, legendary_pokemon_id: 144)

Card.create!(question: "5 - 2 = ?", answer: "3", pokemon_id: 23, deck_id: 2)
Card.create!(question: "8 - 3 = ?", answer: "5", pokemon_id: 37, deck_id: 2)
Card.create!(question: "3 - 2 = ?", answer: "1", pokemon_id: 29, deck_id: 2)
Card.create!(question: "2 - 2 = ?", answer: "0", pokemon_id: 118, deck_id: 2)
Card.create!(question: "10 - 1 = ?", answer: "9", pokemon_id: 43, deck_id: 2)
Card.create!(question: "6 - 5 = ?", answer: "1", pokemon_id: 35, deck_id: 2)
Card.create!(question: "7 - 5 = ?", answer: "2", pokemon_id: 56, deck_id: 2)
Card.create!(question: "7 - 1 = ?", answer: "6", pokemon_id: 46, deck_id: 2)
Card.create!(question: "9 - 7 = ?", answer: "2", pokemon_id: 69, deck_id: 2)
Card.create!(question: "15 - 6 = ?", answer: "9", pokemon_id: 1, deck_id: 2)
Card.create!(question: "17 - 7 = ?", answer: "10", pokemon_id: 25, deck_id: 2)

Deck.create!(title: "Poke-Multiplication!", complete: false, legendary_pokemon_id: 146)

Card.create!(question: "2 x 6 = ?", answer: "12", pokemon_id: 11, deck_id: 3)
Card.create!(question: "3 x 5 = ?", answer: "15", pokemon_id: 17, deck_id: 3)
Card.create!(question: "4 x 3 = ?", answer: "12", pokemon_id: 30, deck_id: 3)
Card.create!(question: "7 x 2 = ?", answer: "14", pokemon_id: 20, deck_id: 3)
Card.create!(question: "3 x 6 = ?", answer: "18", pokemon_id: 108, deck_id: 3)
Card.create!(question: "4 x 4 = ?", answer: "16", pokemon_id: 104, deck_id: 3)
Card.create!(question: "5 x 5 = ?", answer: "25", pokemon_id: 93, deck_id: 3)
Card.create!(question: "3 x 7 = ?", answer: "21", pokemon_id: 133, deck_id: 3)
Card.create!(question: "4 x 6 = ?", answer: "24", pokemon_id: 83, deck_id: 3)
Card.create!(question: "10 x 2 = ?", answer: "20", pokemon_id: 100, deck_id: 3)