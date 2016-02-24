require 'rails_helper'

RSpec.describe Interest do 
	it {should have_many :interest_users}
	it {should have_many :users}
	it {should validate_presence_of :name}
	
	it 'should downcase its name before saving' do 
		i = Interest.new(name: "BANANAS")
		i.save
		expect(i.name).to eq('bananas')
	end
end