15.times do
  Book.create!(isbn: Faker::Number.number(4), title: Faker::Superhero.power, quantity: Faker::Number.between(2, 15))
end

book_ids = Book.ids

45.times do
  Flow.create!(book_id: book_ids.sample, oldQuantity: Faker::Number.between(2, 15), newQuantity: Faker::Number.between(2, 15))
end
