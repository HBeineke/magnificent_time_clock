module Reports
  class Year < Report
    def title
      report_date.strftime("%Y")
    end
  end
end
