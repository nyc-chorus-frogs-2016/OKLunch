require 'rails_helper'

RSpec.describe Conversation do 
	it {should have_many :messages}
end