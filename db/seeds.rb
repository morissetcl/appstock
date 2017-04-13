15.times do
  Book.create!(isbn: Faker::Number.number(4), title: Faker::Superhero.power, quantity: Faker::Number.between(2, 15))
end
