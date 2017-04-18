users = User.create!([
                       { email: Faker::Internet.email,password:'wxcvbn'}
                     ])


15.times do
  Book.create!(isbn: Faker::Number.number(4), title: Faker::Superhero.power, user_id: 1 )
end

book_ids = Book.ids


95.times do
  Flow.create!(book_id: book_ids.sample, newQuantity: Faker::Number.between(2, 15), oldQuantity: Faker::Number.between(2, 15))
end
