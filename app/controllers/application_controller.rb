class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_report_root, :running_periods

  def current_report_root
    @current_report_root = @report.try(:report_root)
  end

  def running_periods
    @running_periods = Period.where(ended_at: nil)
  end
end
