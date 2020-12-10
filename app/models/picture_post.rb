class PicturePost < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  
  belongs_to :user

  validates :picture_url, presence: true
  validates :user_id, presence: true
end
