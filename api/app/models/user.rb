class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
        :rememberable, :validatable, :recoverable, :trackable
  include DeviseTokenAuth::Concerns::User

  validates :first_name, { presence: true, length: { maximum: 10 } }
  validates :last_name, { presence: true, length: { maximum: 10 } }

  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  has_many :follows
  has_many :followings, through: :follows, source: :followed
  has_many :reverses_of_follow, class_name: 'Follow', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_follow, source: :follower

  def follow(other_user)
    follows.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = follows.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end
