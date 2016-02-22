class MatchUser < ActiveRecord::Base
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  belongs_to :target, foreign_key: :target_id, class_name: "User"

  validates :creator_id, uniqueness: {scope: :target_id}

  validate :different_users, on: :create

  def different_users
    if self.creator_id == self.target_id
      errors.add(:creator, "creator can't be target")
    end
  end


end
