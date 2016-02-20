class Restaurant < ActiveRecord::Base
  has_many :match_restaurants

  def self.next(user)
    # return all restaurants where there is no matchrestaurant record for that user and that restaurant
    all_unswiped = self.includes(:match_restaurants).where( :match_restaurants => {restaurant_id: nil})
    #sample from them
    all_unswiped.sample
  end
end
