module Reports
  class Month < Report
    def title
      report_date.strftime("%m")
    end
  end
end
