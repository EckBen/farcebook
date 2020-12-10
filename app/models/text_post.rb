class TextPost < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  
  belongs_to :user

  validates :post_body, presence: true, length: { minimum: 1 }
  validates :user_id, presence: true
end
