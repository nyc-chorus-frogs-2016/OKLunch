require 'rails_helper'

RSpec.describe MatchUser do 
	it {should belong_to :creator}
	it {should belong_to :target}
	# it {should validate_presence_of :creator_id}
	# it {should validate_presence_of :target_id}
#can't test match user properly without creating multiple users for it to belong to
end