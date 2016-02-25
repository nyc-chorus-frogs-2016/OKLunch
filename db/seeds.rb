# keddyb = User.create!(name:'KeddyB', password: "123", age: 24, background_information: Faker::Hipster.paragraph(2), image: 'http://i2.wp.com/www.powerlineblog.com/ed-assets/2016/01/donald-trump.jpg?fit=1200%2C1200')
steven = User.create!(name:'steven', password: "123", age: 44, background_information: "Hi everyone, my name is Steven and I really enjoy Halal food.  I'm currently an instructor at DevBootCamp.  I really like Ruby and Python.", image:'https://avatars3.githubusercontent.com/u/1823156?v=3&s=400', is_desperate:true)
zack = User.create!(name:'zack', password: "123", age: 29, background_information: "Hi yinz!  My name is Zack.  I really really really like bowties.  They're sooooo goooood!", image:'https://avatars3.githubusercontent.com/u/1873205?v=3&s=400', is_desperate:true)
george = User.create!(name:'george', password: "123", age: 26, background_information: "My name is George, not to be confused with George of the jungle, I cannot begin to tell you how many times I have heard that joke.", image:'https://avatars1.githubusercontent.com/u/9616513?v=3&s=400', is_desperate:true)
sam = User.create!(name:'sam', password: "123", age: 33, background_information: "I'm an ex-lawyer and from New Zealand.  I enjoy coding in my freetime and used to have a magnificent beard.", image:'https://avatars1.githubusercontent.com/u/6180588?v=3&s=400')
kristie = User.create!(name:'kristie', password: "123", age: 18, background_information: "My name is Kristie :)  I really enjoy free food.  Please pay for me!", image:'https://avatars3.githubusercontent.com/u/13842937?v=3&s=400')
kerri = User.create!(name:'kerri', password: "123", age: 26, background_information: "Hey everyone, my name is Kerri, I really enjoy meeting new people and would love to have lunch with you.", image:'https://avatars3.githubusercontent.com/u/13250073?v=3&s=400', is_desperate:true)
jake = User.create!(name:'jake', password: "123", age: 22, background_information: "This may be hard to believe, but I am exactly the person that you see in my profile picture, I'm not even kidding.", image:'https://avatars1.githubusercontent.com/u/8248514?v=3&s=400')
phil = User.create!(name:'phil', password: "123", age: 36, background_information: "Hey guys, I'm Phil, I'm a mentor at DevBootCamp and really good at debugging errors.  I'm also really good at eating lunch.", image:'https://avatars1.githubusercontent.com/u/12497818?v=3&s=400')
gary = User.create!(name:'gary', password: "123", age: 24, background_information: "My name is Gary, but my friends call me superboyblue.  I'm a jokester at heart, and I am currently a legend at DevBootCamp known for my infamous self-inflicted water spilling joke.", image:'https://avatars3.githubusercontent.com/u/14539286?v=3&s=400')
iulia = User.create!(name:'iulia', password: "123", age: 29, background_information: "My name is Iulia, I'm from Ukraine.  I work at DevBootCamp and really enjoy teaching alghorithm workshops there.", image:'https://avatars1.githubusercontent.com/u/4469803?v=3&s=400')

response = Yelp.client.search('New York', { term: 'food'})
response.businesses.each do |business|
  Restaurant.create!(name: business.name, address: business.location.display_address.join(", "), average_rating: business.rating, cuisine: business.categories.map{|cuisine|cuisine[0]}.join(', '), image_url: business.image_url, phone: business.phone)
end

users = User.all[1..-1]
Restaurant.all.each do |restaurant|
  users.each do |user|
    MatchRestaurant.create!(user: user, restaurant: restaurant, match: true)
    Swipe.create!(swiper:user, swipee:steven, direction: true, restaurant: restaurant)
  end
end

all_interests = ["fishing", "outdoors", "diy", "dancing", "hella chill", "mustaches", "tennis", "drinking lots of water", "cranberries", "jello", "pumpkins", "ice skating", "rock n' roll", "magic tricks", "CSS"]

all_interests.each do |interest|
  Interest.create!(name: interest)
end


User.all.each do |user|
  all_ints = Interest.all.shuffle
  first_three = all_ints[(0..2)]
  first_three.each do |int|
    InterestUser.create!(user: user, interest: int)
  end
end


############ KB'S SPECIAL SEEDS FOR TESTING ##################

# a = User.create!(name: "Adele", password: "123", age: 27, background_information: "rolling in the deep", is_desperate: true, image: Faker::Avatar.image(nil, "150x150"))
# b = User.create!(name: "Taylor", password: "123", age: 26, background_information: "baby now we got bad blood", is_desperate: true, image: Faker::Avatar.image(nil, "150x150"))
# c = User.create!(name: "Justin", password: "123", age: 25, background_information: "what do u mean", is_desperate: true, image: Faker::Avatar.image(nil, "150x150"))
# d = User.create!(name: "CarlyRae", password: "123", age: 27, background_information: "i really really really really really really like you", is_desperate: true, image: Faker::Avatar.image(nil, "150x150"))

# response = Yelp.client.search('New York', { term: 'food'})
# response.businesses.each do |business|
#   Restaurant.create!(name: business.name, address: business.location.display_address.join(", "), average_rating: business.rating, cuisine: business.categories.map{|cuisine|cuisine[0]}.join(', '), image_url: business.image_url, phone: business.phone)
# end

# Restaurant.all.each do |restaurant|
#   User.all.each do |user|
#     MatchRestaurant.create!(user: user, restaurant: restaurant, match: true)
#   end
# end

# all_interests = ["fishing", "outdoors", "diy", "dancing", "hella chill", "mustaches", "tennis", "drinking lots of water", "cranberries", "jello", "pumpkins", "ice skating", "rock n' roll", "magic tricks", "CSS"]

# all_interests.each do |interest|
#   Interest.create!(name: interest)
# end

# User.all.each do |user|
#   all_ints = Interest.all.shuffle
#   first_three = all_ints[(0..2)]
#   first_three.each do |int|
#     InterestUser.create!(user: user, interest: int)
#   end
# end
