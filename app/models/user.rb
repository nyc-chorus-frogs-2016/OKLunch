class User < ActiveRecord::Base
  has_secure_password
  has_many :interest_users
  has_and_belongs_to_many(:users,
    :join_table => "match_users",
    :foreign_key => "creator_id",
    :association_foeign_key => "target_id")
  has_many :authorizations

  has_many :restaurants, through: :match_restaurants

  validates :name, presence: true

  has_many :swipes_as_swipee, foreign_key: :swipee_id, class_name: "Swipe"
  has_many :swipes_as_swiper, foreign_key: :swiper_id, class_name: "Swipe"
  has_many :swiped_users, through: :swipes_as_swiper, source: :swipee, foreign_key: :swipee_id
  has_many :swipers, through: :swipes_as_swipee, source: :swiper, foreign_key: :swiper_id

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
      user.image = auth.info.image
      user.password = SecureRandom.uuid
      user.save!
    end
  end
end
