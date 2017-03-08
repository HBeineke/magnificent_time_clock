# This file should contain all the report creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Report.delete_all
TimeCard.delete_all

user = CreateAdminService.new.call

report_total = ReportTotal.create(user: user)
report_year = ReportYear.create(report: report_total, report_date: DateTime.new(2016, 1, 1))
report_month = ReportMonth.create(report: report_year, report_date: DateTime.new(2016, 1, 1))
report_week = ReportWeek.create(report: report_month, report_date: DateTime.new(2016, 1, 1))
7.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2016, 1, report_week.report_date.day + day + 1, 17) - 8.hours,
    work_end: DateTime.new(2016, 1, report_week.report_date.day + day + 1, 17, 30),
    break_start: DateTime.new(2016, 1, report_week.report_date.day + day + 1, 17) - 4.hours,
    break_end: DateTime.new(2016, 1, report_week.report_date.day + day + 1, 17) - 3.hours - 30.minutes,
    report: report_week
  )
end
report_week = ReportWeek.create(report: report_month, report_date: DateTime.new(2016, 1, 8))
7.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2016, 1, report_week.report_date.day + day + 1, 17) - 8.hours,
    work_end: DateTime.new(2016, 1, report_week.report_date.day + day + 1, 17, 30),
    break_start: DateTime.new(2016, 1, report_week.report_date.day + day + 1, 17) - 4.hours,
    break_end: DateTime.new(2016, 1, report_week.report_date.day + day + 1, 17) - 3.hours - 30.minutes,
    report: report_week
  )
end



report_year = ReportYear.create(report: report_total, report_date: DateTime.new(2015, 1, 1))
report_month = ReportMonth.create(report: report_year, report_date: DateTime.new(2015, 1, 1))
report_week = ReportWeek.create(report: report_month, report_date: DateTime.new(2015, 1, 1))
7.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2015, 1, report_week.report_date.day + day + 1, 17) - 8.hours,
    work_end: DateTime.new(2015, 1, report_week.report_date.day + day + 1, 17, 30),
    break_start: DateTime.new(2015, 1, report_week.report_date.day + day + 1, 17) - 4.hours,
    break_end: DateTime.new(2015, 1, report_week.report_date.day + day + 1, 17) - 3.hours - 30.minutes,
    report: report_week
  )
end
report_week = ReportWeek.create(report: report_month, report_date: DateTime.new(2016, 1, 8))
7.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2015, 1, report_week.report_date.day + day + 1, 17) - 8.hours,
    work_end: DateTime.new(2015, 1, report_week.report_date.day + day + 1, 17, 30),
    break_start: DateTime.new(2015, 1, report_week.report_date.day + day + 1, 17) - 4.hours,
    break_end: DateTime.new(2015, 1, report_week.report_date.day + day + 1, 17) - 3.hours - 30.minutes,
    report: report_week
  )
end
