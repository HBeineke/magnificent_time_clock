class PeriodFactory
  def initialize(date, root_id, tag_name)
    @date = date
    @root = Reports::Root.find(root_id)
    @tag = Tag.find_by(name: tag_name)
  end

  def create!
    period = Period.new(started_at: @date, tag: @tag)
    day = Reports::Day.find_or_initialize_by(started_at: @date.beginning_of_day, ended_at: @date.end_of_day)
    day.periods << period

    week = Reports::Week.find_or_initialize_by(started_at: @date.beginning_of_week, ended_at: @date.end_of_week)
    week.reports << day

    month = Reports::Month.find_or_initialize_by(started_at: @date.beginning_of_month, ended_at: @date.end_of_month)
    month.reports << week

    year = Reports::Year.find_or_initialize_by(started_at: @date.beginning_of_year, ended_at: @date.end_of_year)
    year.reports << month

    @root.reports << year
    @root.save!
  end
end
