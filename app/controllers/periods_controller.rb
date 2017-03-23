class PeriodsController < ApplicationController
  def create
    report_id = params[:report_id]
    period = Period.new
    period.tag = Tag.where(name: 'work').first

    if PeriodFactory.new(DateTime.current, report_id, 'work').create!
      flash[:notice] = "Period created"
      redirect_to(:back)
    else
      flash.now[:error] = "#{period.errors.full_messages}"
      redirect_to(:back)
    end
  end

  def update
    period = Period.find(params[:id])
    period.ended_at = DateTime.current

    if period.save
      flash[:notice] = "Period updated"
      redirect_to(:back)
    else
      flash.now[:error] = "#{period.errors.full_messages}"
      redirect_to(:back)
    end
  end
end
