class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :lockable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  
  has_many :text_posts, dependent: :destroy
  has_many :picture_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :rec_friendships, class_name: "Friendship", foreign_key: :friend_id
  has_many :rec_friends, through: :rec_friendships, source: :user

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name.split[0]
      user.last_name = auth.info.name.split[1]
      user.username = auth.info.name
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
