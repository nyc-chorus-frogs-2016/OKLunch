class Interest < ActiveRecord::Base
  validates :name, presence: true
  has_many :interest_users

  before_save :downcase_name

  def downcase_name
    self.name.downcase!
  end
end
