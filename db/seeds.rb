10.times do
User.create!(name: Faker::Name.name, password: "123", age: Faker::Number.number(2), background_information: Faker::Hipster.paragraph(2))
end

response = Yelp.client.search('New York', { term: 'food' })
response.businesses.each do |business|
  Restaurant.create!(name: business.name, address: business.location.display_address.join(", "), average_rating: business.rating, cuisine: business.categories.map{|cuisine|cuisine[0]}.join(', '), image_url: business.image_url, phone: business.phone)
end

Restaurant.all.each do |restaurant|
  User.all.each do |user|
    MatchRestaurant.create!(user: user, restaurant: restaurant, match: true)
  end
end

# 20.times do
#   MatchUser.create!(creator: User.all.sample, target: User.all.sample, status: "Matched")
# end

# 20.times do
#   Interest.create!(name: Faker::Hipster.word)
# end
# 20.times do
#   InterestUser.create!(user: User.all.sample, interest: Interest.all.sample)
# end
