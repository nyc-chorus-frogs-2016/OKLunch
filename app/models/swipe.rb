class Swipe < ActiveRecord::Base
  belongs_to :swiper, foreign_key: :swiper_id, class_name: "User"
  belongs_to :swipee, foreign_key: :swipee_id, class_name: "User"
  belongs_to :restaurant


  def search_for_match(swipe_creator)
  	current_swipe = Swipe.find_by(swiper_id: swipe_creator.id)
  	match_swipe = Swipe.where(swiper: current_swipe.swipee, swipee: current_swipe.swiper)
  	if match_swipe.exists?
  		true
  	else
  		false
  	end
  end


end
