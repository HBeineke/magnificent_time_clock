module Reports
  class Root < Report
    has_many :agreements, foreign_key: :report_id

    def title
      'Total'
    end
  end
end
