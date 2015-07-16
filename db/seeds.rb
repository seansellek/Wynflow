# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.create(full_name: "Test User")
u.email = "test@wynflow.co"
u.password = "test"
u.save

10.times do |i|
  p = Project.create
  p.title = "Project #{i}"
  p.description = "This is a description of project #{i}"
  p.user = u
  p.save
end
