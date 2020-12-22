class User < ApplicationRecord
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

  def can_like(likeable)
    existing_like = Like.where("user_id = ? AND likeable_type = ? AND likeable_id = ?", self.id, likeable.class.name, likeable.id)

    if !existing_like.empty? || likeable.user.id == self.id
      return false
    else
      return true
    end
  end
  
  def content
    t_posts = self.text_posts.to_a
    p_posts = self.picture_posts.to_a
    comments = self.comments.map do |c|
      while c.commentable_type == "Comment"
        c = c.commentable
      end
      c.commentable
    end

    t_posts.concat p_posts
    t_posts.concat comments
    return t_posts.sort_by { |item| item.created_at }
  end

  def list_of_friends(status = false)
    (status == "pending") ? true : false

    friend_list = self.friendships.where(pending: status).map {|f| f.friend}

    self.rec_friendships.where(pending: status).each do |friend|
      friend_list.push(friend.user)
    end

    return friend_list.sort_by {|friend| friend.first_name}
  end

  def list_of_rec_requests
    self.rec_friendships.where(pending: true).to_a
  end

  def remember_me
    (super == nil) ? true : super
  end

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

  def unseen_likes_comments
    my_comments = self.comments.map {|c| c.id }
    my_text_posts = self.text_posts.map {|p| p.id}
    my_pic_posts = self.picture_posts.map {|p| p.id}

    unseen_likes = Like.where("seen = false AND likeable_type = ? AND likeable_id IN (?)", "TextPost", my_text_posts)
                       .or(Like.where("seen = false AND likeable_type = ? AND likeable_id IN (?)", "PicturePost", my_pic_posts))
                       .or(Like.where("seen = false AND likeable_type = ? AND likeable_id IN (?)", "Comment", my_comments))

    unseen_comments = Comment.where("seen = false AND commentable_type = ? AND commentable_id IN (?)", "TextPost", my_text_posts)
                             .or(Comment.where("seen = false AND commentable_type = ? AND commentable_id IN (?)", "PicturePost", my_pic_posts))
                             .or(Comment.where("seen = false AND commentable_type = ? AND commentable_id IN (?)", "Comment", my_comments))

    unseen_activity = unseen_likes.to_a + unseen_comments.to_a

    return unseen_activity.sort_by { |a| a.created_at }
  end

  def viewable_content
    current_friends = self.list_of_friends.map {|f| f.id }
    current_friends.push(self.id)
    
    content = TextPost.where(user_id: current_friends).to_a
    pics_content = PicturePost.where(user_id: current_friends).to_a

    content.concat pics_content

    return (content.sort_by {|post| post.created_at}).reverse
  end
end
