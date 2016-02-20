class Restaurant < ActiveRecord::Base

  has_many :match_restaurants
  has_many :swipes

  def self.next(user)
	self.all.to_a.reject {|restaurant| restaurant.match_restaurants.where(user_id: user.id).any?}.sample
  end
end
