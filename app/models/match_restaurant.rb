class MatchRestaurant < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: :user_id
  belongs_to :restaurant, class_name: "Restaurant", foreign_key: :restaurant_id

  # validates :uniqueness of the user per restaurant

  def delete_after_day
  end

  def self.return_matchable_users(current_user)
    self.all.reject{|mr| mr.user.swipers.select{|swiper| swiper.id = User.first.id}.any? || mr.user.swipers.select{|swipee| swipee.id = User.first.id}.any?}.map{|mr| mr.user}
  end
end
