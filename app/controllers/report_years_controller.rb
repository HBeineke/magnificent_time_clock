class ReportYearsController < ApplicationController
  def show
    @report = ReportYear.find(params[:id])
  end
end
