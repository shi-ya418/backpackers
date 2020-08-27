class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: {case_sensitive: true}
  
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :following_relationships,foreign_key: "follower_id", class_name: "FollowRelationship",  dependent: :destroy
  has_many :follow_relationships,foreign_key: "following_id",class_name: "FollowRelationship", dependent: :destroy
  has_many :followings, through: :follow_relationships
  has_many :follower_relationships,foreign_key: "following_id",class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships 

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def following?(other_user)
    self.following_relationships.find_by(following_id: other_user.id)
  end

  def follow(other_user)
    self.following_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    self.following_relationships.find_by(following_id: other_user.id).destroy
  end

  def followed_by?(user)
    followers.where(user_id: user.id).exists?
    # following.where(user_id: user.id).exists?
  end

end
