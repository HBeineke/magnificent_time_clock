class PeriodsController < ApplicationController
  def new
  end

  def create
    @period = Period.new
    @period.report_root_id = current_user.report.id
    @period.tag = Tag.where(name: 'work').first

    if PeriodFactory.new(DateTime.current, current_user.report.id, 'work').create!
      flash[:notice] = "Thanks for your comment"
      render 'new'
    else
      flash.now[:error] = "#{@recipe.errors.full_messages}"
      render 'new'
    end
  end
end
