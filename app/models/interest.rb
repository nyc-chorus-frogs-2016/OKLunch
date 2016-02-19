class Interest < ActiveRecord::Base
  validates :name, presence: true
  has_many :interest_users
end
