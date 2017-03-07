# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
RecordSet.delete_all
TimeCard.delete_all

user = CreateAdminService.new.call

record_set_year = RecordSet.create(user: user)
record_set_month = RecordSet.create(record_set: record_set_year)

25.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2016, 1, day + 1, 17) - 8.hours,
    work_end: DateTime.new(2016, 1, day + 1, 17, 30),
    break_start: DateTime.new(2016, 1, day + 1, 17) - 4.hours,
    break_end: DateTime.new(2016, 1, day + 1, 17) - 3.hours - 30.minutes,
    record_set: record_set_month
  )
end

25.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2016,  2, day + 1, 17) - 8.hours,
    work_end: DateTime.new(2016, 2, day + 1, 17, 30),
    break_start: DateTime.new(2016, 2, day + 1, 17) - 4.hours,
    break_end: DateTime.new(2016, 2, day + 1, 17) - 3.hours - 30.minutes,
    record_set: record_set_month
  )
end


record_set_year = RecordSet.create(user: user)
record_set_month = RecordSet.create(record_set: record_set_year)

25.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2015, 1, day + 1, 17) - 8.hours,
    work_end: DateTime.new(2015, 1, day + 1, 17, 30),
    break_start: DateTime.new(2015, 1, day + 1, 17) - 4.hours,
    break_end: DateTime.new(2015, 1, day + 1, 17) - 3.hours - 30.minutes,
    record_set: record_set_month
  )
end

25.times.each do |day|
  TimeCard.create!(
    work_start: DateTime.new(2015,  2, day + 1, 17) - 8.hours,
    work_end: DateTime.new(2015, 2, day + 1, 17, 30),
    break_start: DateTime.new(2015, 2, day + 1, 17) - 4.hours,
    break_end: DateTime.new(2015, 2, day + 1, 17) - 3.hours - 30.minutes,
    record_set: record_set_month
  )
end
