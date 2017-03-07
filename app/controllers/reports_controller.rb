class ReportsController < ApplicationController
  def welcome
    @reports = current_user ? current_user.reports : []
  end
end
