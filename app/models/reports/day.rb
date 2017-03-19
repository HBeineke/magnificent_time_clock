module Reports
  class Day < Report
    def title
      started_at.strftime("%D")
    end
  end
end
