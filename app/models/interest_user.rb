class InterestUser < ActiveRecord::Base
  belongs_to :interest
  belongs_to :user

  validates: interest_id, uniquenes: {scope: :user_id}
end
