class TimeCard < ApplicationRecord
  belongs_to :report

  # decorator
  def break_time
    ((break_end - break_start) / 1.hour).round
  end

  def work_time
    ((work_end - work_start) / 1.hour).round
  end
end
