class Agreement < ApplicationRecord
  has_one :period, as: :parent
  belongs_to :report
  has_many :agreement_interrupts
  has_many :agreement_replacements

  has_one :taggable, as: :parent
  has_one :tag, through: :taggable

end
