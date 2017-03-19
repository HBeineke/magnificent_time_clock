module Reports
  class Month < Report
    def title
      started_at.strftime("%m")
    end
  end
end
