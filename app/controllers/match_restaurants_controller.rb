class MatchRestaurantsController < ApplicationController
	def create
		
	end

	def new

	end

	def show
		@user_restaurant = MatchRestaurant.find_by(id: params[:id])
	end
end
