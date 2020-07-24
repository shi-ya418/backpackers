class Post < ApplicationRecord
  has_many :comments
  has_many :goods
  belongs_to :user
  belongs_to :area
end
