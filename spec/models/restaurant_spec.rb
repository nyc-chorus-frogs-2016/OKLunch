require 'rails_helper'

RSpec.describe Restaurant do 
	it {should have_many :match_restaurants}
	it {should have_many :users}
	it {should have_many :swipes}
end