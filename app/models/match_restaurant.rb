class MatchRestaurant < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: :user_id
  belongs_to :restaurant, class_name: "Restaurant", foreign_key: :restaurant_id
end
