class Swipe < ActiveRecord::Base
  belongs_to :swiper, foreign_key: :swiper_id, class_name: "User"
  belongs_to :swipee, foreign_key: :swipee_id, class_name: "User"
  belongs_to :restaurant

  validate :cannot_swipe_on_self, on: :create

  validates :swiper_id, uniqueness: {scope: [:swipee_id, :restaurant_id]}

  def search_for_match(swipe_creator)
  	current_swipe = Swipe.find_by(swiper_id: swipe_creator.id)
  	match_swipe = Swipe.where(swiper: current_swipe.swipee, swipee: current_swipe.swiper)
  	match_swipe.exists?
  end

  def parallel_positive_swipe_exists
    Swipe.where(direction: true).where(swipee_id: self.swiper_id).where(swiper_id: self.swipee_id).count > 0
  end

  def cannot_swipe_on_self
    errors.add(:swiper, "cannot swipe on self") if self.swiper_id == self.swipee_id
  end

end
