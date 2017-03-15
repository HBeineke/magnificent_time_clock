class Goal < ApplicationRecord
  has_many :taggables, as: :parent
  has_many :tags, through: :taggables
  has_one :period, as: :parent
  belongs_to :user
  
  belongs_to :taggable
  def tag=(tag)
    self.taggable = Taggable.create(tag: tag)
  end
  def tag
    taggable.tag
  end
end
