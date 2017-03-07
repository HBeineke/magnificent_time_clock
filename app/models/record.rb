class Record < ApplicationRecord
  belongs_to :record_set

  # decorator
  def break_time
    ((break_end - break_start) / 1.hour).round
  end

  def work_time
    ((work_end - work_start) / 1.hour).round
  end
end
