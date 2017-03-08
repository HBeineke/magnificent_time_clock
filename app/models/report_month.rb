class ReportMonth < Report
  def title
    report_date.strftime("%m")
  end
end
