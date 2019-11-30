class User < ApplicationRecord

  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
  has_many :followers, through: :received_follows, source: :follower

  validates :username, uniqueness: true

end
