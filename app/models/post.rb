class Post < ApplicationRecord

  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_user, through: :likes, source: :user

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end  

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
