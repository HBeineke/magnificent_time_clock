# This file should contain all the report creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Report.delete_all
Period.delete_all
Tag.delete_all
Taggable.delete_all

tag_work = Tag.create(name: 'work')
tag_break = Tag.create(name: 'break')
tag_meeting = Tag.create(name: 'meeting')

user = CreateAdminService.new.call
goal = Goal.create!(
  user: user,
  tag: tag_work,
  period: Period.create(started_at: Time.now, ended_at: Time.now + 40.hours)
)
goal.tags << tag_break

report_total = Reports::Root.create(user: user)
report_year = Reports::Year.create(report: report_total, started_at: DateTime.new(2016, 1, 1))
report_month = Reports::Month.create(report: report_year, started_at: DateTime.new(2016, 1, 1))
report_week = Reports::Week.create(report: report_month, started_at: DateTime.new(2016, 1, 1))
7.times.each do |day|
  report_day = Reports::Day.create(report: report_week, started_at: DateTime.new(2016, 1, 1))
  d = report_day.started_at.day + day + 1
  Period.create!(
    started_at: DateTime.new(2016, 1, d + 1, 17) - 8.hours,
    ended_at: DateTime.new(2016, 1, d + 1, 17, 30),
    parent: report_day,
    tag: tag_work
  )
end

7.times.each do |day|
  report_day = Reports::Day.create(report: report_week, started_at: DateTime.new(2016, 1, 8))
  d = report_day.started_at.day + day + 1
  Period.create!(
    started_at: DateTime.new(2016, 1, d + 1, 17) - 8.hours,
    ended_at: DateTime.new(2016, 1, d + 1, 17, 30),
    parent: report_day,
    tag: tag_work
  )
end



report_year = Reports::Year.create(report: report_total, started_at: DateTime.new(2015, 1, 1))
report_month = Reports::Month.create(report: report_year, started_at: DateTime.new(2015, 1, 1))
report_week = Reports::Week.create(report: report_month, started_at: DateTime.new(2015, 1, 1))
7.times.each do |day|
  report_day = Reports::Day.create(report: report_week, started_at: DateTime.new(2015, 1, 1))
  d = report_day.started_at.day + day + 1
  Period.create!(
    started_at: DateTime.new(2016, 1, d + 1, 17) - 8.hours,
    ended_at: DateTime.new(2016, 1, d + 1, 17, 30),
    parent: report_day,
    tag: tag_work
  )
end

7.times.each do |day|
  report_day = Reports::Day.create(report: report_week, started_at: DateTime.new(2015, 1, 8))
  d = report_day.started_at.day + day + 1
  Period.create!(
    started_at: DateTime.new(2016, 1, d + 1, 17) - 8.hours,
    ended_at: DateTime.new(2016, 1, d + 1, 17, 30),
    parent: report_day,
    tag: tag_work
  )
end
