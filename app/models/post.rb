class Post < ApplicationRecord
  has_many :comments
  has_many :goods
  has_many :post_tags
  has_many :tags, through: :post_tags
  belongs_to :user
  has_many :likes
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

  accepts_nested_attributes_for :tags, allow_destroy: true 
end
