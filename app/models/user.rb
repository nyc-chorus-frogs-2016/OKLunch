class User < ActiveRecord::Base

  validates :name, presence: true

  has_secure_password

  has_many :interest_users
  has_many :interests, through: :interest_users

  has_many :match_users, foreign_key: :creator_id
  has_many :match_users, foreign_key: :target_id

  has_and_belongs_to_many(:users,
    :join_table => "match_users",
    :foreign_key => "creator_id",
    :association_foreign_key => "target_id")

  has_many :restaurants, through: :match_restaurants

  has_many :swipes_as_swipee, foreign_key: :swipee_id, class_name: "Swipe"
  has_many :swipes_as_swiper, foreign_key: :swiper_id, class_name: "Swipe"
  has_many :swiped_users, through: :swipes_as_swiper, source: :swipee, foreign_key: :swipee_id
  has_many :swipers, through: :swipes_as_swipee, source: :swiper, foreign_key: :swiper_id

  has_many :match_restaurants


  def interests_as_string
    self.interests.pluck(:name).join(", ");
  end

  def common_interests(usertwo)
    self.interests.select do |interest|
      usertwo.interests.include? (interest)
    end
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
