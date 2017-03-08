class ReportWeeksController < ApplicationController
  def show
    @report = ReportWeek.find(params[:id])
  end
end
