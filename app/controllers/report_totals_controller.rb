class ReportTotalsController < ApplicationController
  def show
    @report = current_user ? current_user.report : nil
  end
end
