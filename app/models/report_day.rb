class ReportDay < Report
  def title
    report_date.strftime("%D")
  end
end
