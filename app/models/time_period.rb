class TimePeriod < ApplicationRecord
  belongs_to :report

  # decorator
  def duration
    ((ended_at - started_at) / 1.hour).round
  end
end
