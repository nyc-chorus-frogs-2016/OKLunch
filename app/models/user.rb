class User < ActiveRecord::Base
  has_secure_password
  has_many :interest_users
  has_and_belongs_to_many(:users,
    :join_table => "match_users",
    :foreign_key => "creator_id",
    :association_foeign_key => "target_id")
  has_many :authorizations
  validates :name, presence: true
  # validates :uid, presence: true, uniqueness: true
  # validates :uid, uniqueness: { scope: :provider }

  has_many :match_restaurants

  def find_common_interests(usertwo)
  end

  def self.from_omniauth(auth)
    where(provider:auth[:provider], uid:auth[:uid]).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
#      user.oauth_token = auth.credentials.token
#      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.uuid
      user.save!
    end
  end
end
