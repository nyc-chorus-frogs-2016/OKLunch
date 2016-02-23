class MatchUser < ActiveRecord::Base
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  belongs_to :target, foreign_key: :target_id, class_name: "User"

  validates :creator_id, uniqueness: {scope: :target_id}

  validate :different_users, on: :create

  def different_users
    errors.add(:creator, "creator can't be target") if self.creator_id == self.target_id
  end

  def other_user(user)
    if target == user
      return creator
    elsif creator == user
      return target
    else
      return nil
    end
  end

end
