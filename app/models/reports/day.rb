module Reports
  class Day < Report
    def title
      report_date.strftime("%D")
    end
  end
end
