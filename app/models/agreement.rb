class Agreement < ApplicationRecord
  has_one :period, as: :parent
  belongs_to :report

  belongs_to :taggable
  def tag=(tag)
    self.taggable = Taggable.create(tag: tag)
  end
  def tag
    taggable.tag
  end
end
