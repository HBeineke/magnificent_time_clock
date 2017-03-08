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

report_year = ReportYear.create(user: user, report_date: DateTime.new(2016, 1, 1))
report_month = ReportMonth.create(report: report_year, report_date: DateTime.new(2016, 1, 1))
25.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2016, 1, day + 1, 17) - 8.hours,
    work_end: DateTime.new(2016, 1, day + 1, 17, 30),
    break_start: DateTime.new(2016, 1, day + 1, 17) - 4.hours,
    break_end: DateTime.new(2016, 1, day + 1, 17) - 3.hours - 30.minutes,
    report: report_month
  )
end

report_month = ReportMonth.create(report: report_year, report_date: DateTime.new(2016, 2, 1))
25.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2016,  2, day + 1, 17) - 8.hours,
    work_end: DateTime.new(2016, 2, day + 1, 17, 30),
    break_start: DateTime.new(2016, 2, day + 1, 17) - 4.hours,
    break_end: DateTime.new(2016, 2, day + 1, 17) - 3.hours - 30.minutes,
    report: report_month
  )
end


report_year = ReportYear.create(user: user, report_date: DateTime.new(2015, 1, 1))
report_month = ReportMonth.create(report: report_year, report_date: DateTime.new(2015, 1, 1))
25.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2015, 1, day + 1, 17) - 8.hours,
    work_end: DateTime.new(2015, 1, day + 1, 17, 30),
    break_start: DateTime.new(2015, 1, day + 1, 17) - 4.hours,
    break_end: DateTime.new(2015, 1, day + 1, 17) - 3.hours - 30.minutes,
    report: report_month
  )
end

report_month = ReportMonth.create(report: report_year, report_date: DateTime.new(2015, 2, 1))
25.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2015,  2, day + 1, 17) - 8.hours,
    work_end: DateTime.new(2015, 2, day + 1, 17, 30),
    break_start: DateTime.new(2015, 2, day + 1, 17) - 4.hours,
    break_end: DateTime.new(2015, 2, day + 1, 17) - 3.hours - 30.minutes,
    report: report_month
  )
end
