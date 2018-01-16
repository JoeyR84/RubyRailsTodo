require 'faker'

5.times do
  User.create!(
  email:    Faker::Internet.free_email,
  password: Faker::Internet.password
  )
end
users = User.all

15.times do
  Item.create!(
    name: Faker::RickAndMorty.quote,
    user: users.sample
  )
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
