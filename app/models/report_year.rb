class ReportYear < Report
  def title
    report_date.strftime("%Y")
  end
end
