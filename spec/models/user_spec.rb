require 'rails_helper'

RSpec.describe User do 
	it {should have_many :interest_users}
	it {should have_many :interests}
	it {should have_many :restaurants}
	it {should have_many :match_restaurants}
	it {should have_many :swipers}
	it {should validate_presence_of :name}
	
	it 'should respond to name' do 
		u = User.new
		expect(u).to respond_to(:name)
	end

end