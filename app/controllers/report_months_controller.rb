class ReportMonthsController < ApplicationController
  def show
    @report = ReportMonth.find(params[:id])
  end
end
