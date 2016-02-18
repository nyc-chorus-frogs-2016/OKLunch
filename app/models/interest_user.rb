class InterestUser < ActiveRecord::Base
  belongs_to :interest
  belongs_to :user

end
