module Reports
  class Year < Report
    def title
      started_at.strftime("%Y")
    end
  end
end
