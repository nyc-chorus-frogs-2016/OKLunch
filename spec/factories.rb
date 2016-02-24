#Conversation, interest, interest_user, match_restaurant, match_user, message, restaurant, swipe, user
FactoryGirl.define do 
	factory :user do
		name { Faker::Name.name}
		age { 29}
		password  "123"
	end

	factory :restaurant do
		name { Faker::Company.name}
		address { Faker::Address.street_address}
		average_rating { Faker::Number.between(1, 5)}
		cuisine { Faker::Book.genre}
		image_url { Faker::Placeholdit.image("50x50", 'jpg')}
		phone { Faker::Company.swedish_organization_number}
	end 

	factory :conversation do 
		sender_id {:user.id}
		recipient_id {:user.id} #wrong
	end
	
	factory :match_user do
		creator_id {:user.id}
		target_id {:user.id}
		status { "accepted"}
		accepted { true}
	end

	factory :match_restaurant do 
		user_id {:user.id}
		restaurant_id {:restaurant.id}
		match {true}
		is_permanent {false}
	end

	factory :message do
		conversation_id {:conversation.id}
		match_user_id {:match_user.id}
		sender_id {:user.id}
		recipient_id {:user.id}
		content { Faker::Hipster.paragraph }
	end 

	factory :interest do 
		name {Factory::Hipster.word}
	end

	factory :interest_user do 
		user_id {:user.id}
		interest_id {:interest.id}
	end

	factory :swipe do 
		swiper_id {:user.id}
		swipee_id {:user.id}
		direction { true}
		restaurant_id {:restaurant.id}
	end
end