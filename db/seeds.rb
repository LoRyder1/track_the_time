# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create!(username:"bob", display_name:"bob", email:"bob@mail.com", password:"password")

c = Customer.create!(company:"CoverMyMeds")

p = Project.create!(project_name:"Lays of Rome", customer_id: c.id)

t = Task.create!(task_name:"Temples and Gods", project_id: p.id)

Timeentry.create!(project_id:p.id, user_id:u.id, task_id:t.id, duration:120.543, start_time:Time.now, note:Faker::Lorem.sentence)