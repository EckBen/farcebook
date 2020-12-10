class Comment < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :comment_body, presence: true, length: { minimum: 1 }
  validates :commentable_type, presence: true
  validates :commentable_id, presence: true
  validates :user_id, presence: true
end
