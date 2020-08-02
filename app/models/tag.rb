class Tag < ApplicationRecord
  before_save :downcase_name

  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  validates :name, uniqueness:true

  private
  def downcase_name
    self.name.downcase!
  end
end
