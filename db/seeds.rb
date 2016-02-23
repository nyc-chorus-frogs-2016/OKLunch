keddyb = User.create!(name:'KeddyB', password: "123", age: 24, background_information: Faker::Hipster.paragraph(2))

10.times do
  User.create!(name: Faker::Name.name, password: "123", age: Faker::Number.number(2), background_information: Faker::Hipster.paragraph(2), is_desperate: true, image: Faker::Avatar.image(nil, "150x150"))
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

# 20.times do
#   MatchUser.create!(creator: User.all.sample, target: User.all.sample, status: "Matched")
# end

all_interests = ["fishing", "outdoors", "diy", "dancing", "hella chill", "mustaches", "tennis", "drinking lots of water", "cranberries", "jello", "pumpkins", "ice skating", "rock n' roll", "magic tricks", "CSS"]

all_interests.each do |interest|
  Interest.create!(name: interest)
end


User.all.each do |user|
  all_ints = Interest.all.shuffle
  first_three = all_ints[(0..2)]
  first_three.each do |int|
    # puts "#{user.name} has an interest in #{int.name}"
    InterestUser.create!(user: user, interest: int)
  end
end
