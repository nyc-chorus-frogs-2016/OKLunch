require 'rails_helper'

RSpec.describe InterestUser do 
	it {should belong_to :interest}
	it {should belong_to :user}
end