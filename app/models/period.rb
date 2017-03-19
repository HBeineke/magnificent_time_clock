class Period < ApplicationRecord
  belongs_to :parent, polymorphic: true
  has_one :taggable, as: :parent
  has_one :tag, through: :taggable

  before_validation :default_started_at, :find_or_create_report_day

  attr_accessor :report_root_id

  # decorator
  def duration
    return unless ended_at
    
    ((ended_at - started_at) / 1.hour).round
  end

  private
  def default_started_at
    unless started_at
      self.started_at = DateTime.current
    end
  end

  def find_or_create_report_day
    unless parent
      self.parent = Reports::Day.find_or_create_by(started_at, report_root_id)
    end
  end
end
