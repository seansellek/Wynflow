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

p = Project.create
p.title = "Wynked In"
p.description = "Linkedin for Wyncode"
p.repo = "www.github.com"
p.url = "www.wynkedin.co"
p.collab = "Prahasi"
p.cohort = "6"
p.img = "http://www.savethecat.com/wp-content/uploads/2015/06/cats.jpg"
p.user = u
p.save


p = Project.create
p.title = "ToDo List"
p.description = "Creates a Ruby on Rails ToDo List Web Application"
p.repo = "www.github.com"
p.url = "www.todo.co"
p.collab = "Ariel"
p.cohort = "6"
p.img = "http://gagnamite.com/wp-content/uploads/2013/05/cute_cat_404_error_im_sorry.jpg"
p.user = u
p.save

p = Project.create
p.title = "Blog"
p.description = "Rails Blog Application"
p.repo = "www.github.com"
p.url = "www.blog.co"
p.collab = "Sean and Ana"
p.cohort = "6"
p.img = "http://s.quickmeme.com/img/a8/a8022006b463b5ed9be5a62f1bdbac43b4f3dbd5c6b3bb44707fe5f5e26635b0.jpg"
p.user = u
p.save
