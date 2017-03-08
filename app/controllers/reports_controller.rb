class ReportsController < ApplicationController
  def show
    @year_reports = current_user ? current_user.reports : []

    if !params[:id]
      @year_report = current_user ? @year_reports.first : nil
    else
      @year_report = Report.find(params[:id])
    end

    @month_reports = @year_report.reports
    @month_report = @month_reports.first
  end
end
