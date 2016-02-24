class MatchRestaurant < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates_uniqueness_of :user, scope: :restaurant

  def self.return_matchable_users(current_user)
    self.all.reject{|mr| mr.user.swipers.select{|swiper| swiper.id == current_user.id}.any? || mr.user.swipers.select{|swipee| swipee.id == current_user.id}.any?}.map{|mr| mr.user}
  end
end
