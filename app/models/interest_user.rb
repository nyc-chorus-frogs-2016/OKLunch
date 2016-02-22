class InterestUser < ActiveRecord::Base
  belongs_to :interest
  belongs_to :user

  validates :interest_id, uniqueness: {scope: :user_id}
end
