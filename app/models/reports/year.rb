module Reports
  class Year < Report
    before_create :default_ended_at, :find_report_root

    def title
      started_at.strftime("%Y")
    end

    def self.find_or_create_by(date, root_id)
      return unless date

      report_year = Reports::Year.where(started_at: date.beginning_of_year).first
      if report_year
         report_year
      else
        Reports::Year.create(started_at: date.beginning_of_year, root_id: root_id)
      end
    end

    private
    def default_ended_at
      unless ended_at
        self.ended_at = started_at.end_of_year
      end
    end

    def find_report_root
      unless report
        self.report_id = root_id
      end
    end
  end
end
