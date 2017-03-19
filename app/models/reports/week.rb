module Reports
  class Week < Report
    before_create :default_ended_at, :find_or_create_report_month

    def title
      nil
    end

    def self.find_or_create_by(date, root_id)
      return unless date

      report_week = Reports::Week.where(started_at: date.beginning_of_week).first
      if report_week
         report_week
      else
        Reports::Week.create(started_at: date.beginning_of_week, root_id: root_id)
      end
    end

    private
    def default_ended_at
      unless ended_at
        self.ended_at = started_at.end_of_week
      end
    end

    def find_or_create_report_month
      unless report
        self.report = Reports::Month.find_or_create_by(started_at, root_id)
      end
    end
  end
end
