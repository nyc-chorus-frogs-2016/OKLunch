class Restaurant < ActiveRecord::Base
  has_many :swipes

  def self.next(user)
    all_unswiped = self.includes(:swipes).where( :swipes => {restaurant_id: nil})
    all_unswiped.sample
  end
end
