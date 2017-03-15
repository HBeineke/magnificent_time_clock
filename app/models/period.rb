class Period < ApplicationRecord
  belongs_to :report
  has_one :taggable, as: :parent
  has_one :tag, through: :taggable

  # decorator
  def duration
    ((ended_at - started_at) / 1.hour).round
  end
end
