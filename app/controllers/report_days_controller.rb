class ReportDaysController < ApplicationController
  def show
    @report = ReportDay.find(params[:id])
  end
end
