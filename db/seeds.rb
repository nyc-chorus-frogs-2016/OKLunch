keddyb = User.create!(name:'KeddyB', password: "123", age: 24, background_information: Faker::Hipster.paragraph(2), interests: Faker::Hipster.paragraph(1))

50.times do
User.create!(name: Faker::Name.name, password: "123", age: Faker::Number.number(2), background_information: Faker::Hipster.paragraph(2), is_desperate: true, interests: Faker::Hipster.paragraph(1), image: Faker::Avatar.image(nil, "150x150"))
end


response = Yelp.client.search('New York', { term: 'food'})
response.businesses.each do |business|
  Restaurant.create!(name: business.name, address: business.location.display_address.join(", "), average_rating: business.rating, cuisine: business.categories.map{|cuisine|cuisine[0]}.join(', '), image_url: business.image_url, phone: business.phone)
end

users = User.all[1..-1]
Restaurant.all.each do |restaurant|
  users.each do |user|
    MatchRestaurant.create!(user: user, restaurant: restaurant, match: true)
    Swipe.create!(swiper:user, swipee:keddyb, direction: true, restaurant: restaurant)
  end
end

# Swipe.create

# 20.times do
#   MatchUser.create!(creator: User.all.sample, target: User.all.sample, status: "Matched")
# end

# 20.times do
#   Interest.create!(name: Faker::Hipster.word)
# end
# 20.times do
#   InterestUser.create!(user: User.all.sample, interest: Interest.all.sample)
# end
