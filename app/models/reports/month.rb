module Reports
  class Month < Report
    before_create :default_ended_at, :find_or_create_report_year

    def title
      started_at.strftime("%m")
    end

    def self.find_or_create_by(date, root_id)
      return unless date

      report_month = Reports::Month.where(started_at: date.beginning_of_month).first
      if report_month
         report_month
      else
        Reports::Month.create(started_at: date.beginning_of_month, root_id: root_id)
      end
    end

    private
    def default_ended_at
      unless ended_at
        self.ended_at = started_at.end_of_month
      end
    end

    def find_or_create_report_year
      unless report
        self.report = Reports::Year.find_or_create_by(started_at, root_id)
      end
    end
  end
end
