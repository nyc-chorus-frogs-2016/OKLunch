class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many(:users,
    :join_table => "match_users",
    :foreign_key => "creator_id",
    :association_foreign_key => "target_id")

  def find_common_interests(usertwo)

  end

end
