class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: {case_sensitive: true}
  
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
