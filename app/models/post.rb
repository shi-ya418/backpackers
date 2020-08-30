class Post < ApplicationRecord

  has_many :comments
  has_many :post_tags, dependent: :destroy
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

  # def liked_by?(user)
  #   likes.where(user_id: user.id).exists?
  # end

  def save_tags(tag_list)
    tag_list.each do |tag|
      unless find_tag = Tag.find_by(name: tag.downcase)
        begin
          self.tags.create!(name: tag)
        rescue
          nil
        end
      else
        PostTag.create!(post_id: self.id, tag_id: find_tag.id)
      end
    end
  end
end
