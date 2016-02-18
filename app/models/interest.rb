class Interest < ActiveRecord::Base
  validates :name, uniqueness: true
end
