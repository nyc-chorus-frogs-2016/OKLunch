require 'rails_helper'

RSpec.describe MatchRestaurant do 
	subject { FactoryGirl.build(:match_restaurant) }
	it {should belong_to :user}
	it {should belong_to :restaurant}
	# it {should validate_uniqueness_of(:user).scoped_to(:restaurant)} - currently bugged
end