# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "KB", password: "123", age: 26, background_information: "I love Rails")

20.times do
User.create!(name: Faker::Name.name, password: "123", age: Faker::Number.number(2), background_information: Faker::Hipster.paragraph(2))
end

20.times do
Restaurant.create!(name: Faker::App.name, address: Faker::Address.street_address, average_rating: Faker::Number.between(1,5), cuisine: Faker::Hipster.words(2), price_range: Faker::Number.positive)
end

20.times do
  MatchUser.create!(creator: User.all.sample, target: User.all.sample, status: "Matched")
end

20.times do
  MatchRestaurant.create!(user: User.all.sample, restaurant: Restaurant.all.sample)
end

20.times do
  Interest.create!(name: Faker::Hipster.word)
end
20.times do
  InterestUser.create!(user: User.all.sample, interest: Interest.all.sample)
end
