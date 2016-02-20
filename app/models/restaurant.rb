class Restaurant < ActiveRecord::Base
  has_many :match_restaurants

  # def self.next(user)
  #   # return all restaurants where there is no matchrestaurant record for that user and that restaurant
  #   all_unswiped = self.includes(:matchrestaurant).where( :matchrestaurant => {restaurant_id: nil})
  #   #sample from them
  #   all_unswiped.sample
  # end
  def self.next(user)
	self.all.to_a.reject {|restaurant| restaurant.match_restaurants.where(user_id: user.id).any?}.sample
  end
end
