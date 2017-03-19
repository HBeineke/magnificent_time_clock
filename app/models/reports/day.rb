module Reports
  class Day < Report
    before_create :default_ended_at, :find_or_create_report_week

    def title
      started_at.strftime("%D")
    end

    # decorator
    def duration
      ((ended_at - started_at) / 1.hour).round
    end

    def self.find_or_create_by(date, root_id)
      return unless date

      report_day = Reports::Day.where(started_at: date.beginning_of_day).first
      if report_day
         report_day
      else
        Reports::Day.create(started_at: Date.current.beginning_of_day, root_id: root_id)
      end
    end

    private
    def default_ended_at
      unless ended_at
        self.ended_at = started_at.end_of_day
      end
    end

    def find_or_create_report_week
      unless report
        self.report = Reports::Week.find_or_create_by(started_at, root_id)
      end
    end
  end
end
