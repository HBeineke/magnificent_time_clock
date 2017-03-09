class Reports::RootsController < ReportsController
  def show
    @report = current_user ? current_user.report : nil
  end
end
