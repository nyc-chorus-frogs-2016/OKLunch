require 'rails_helper'

RSpec.describe Message do 
	it {should belong_to :conversation}
	it {should belong_to :sender}
	it {should belong_to :recipient}
end