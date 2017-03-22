class Agreement < ApplicationRecord
  has_one :period, as: :parent
  belongs_to :report
  has_many :agreement_interrupts
  has_many :agreement_replacements

  belongs_to :tag
  def tag=(tag)
    self.taggable = Taggable.create(tag: tag)
  end
  def tag
    taggable.tag
  end
end
