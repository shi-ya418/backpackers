class Post < ApplicationRecord
  has_many :comments
  has_many :goods
  has_many :post_tags
  has_many :tags, through: :post_tags
  belongs_to :user

  accepts_nested_attributes_for :tags, allow_destroy: true 
end
