# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "arun1",email: "arun1@google.com",password: "password",password_confirmation: "password",gender: "male",age: "21",bio: "athelte")
User.create(username: "arun2",email: "arun2@google.com",password: "password",password_confirmation: "password",gender: "male",age: "21",bio: "athelte")
User.create(username: "arun3",email: "arun3@google.com",password: "password",password_confirmation: "password",gender: "male",age: "21",bio: "athelte")
User.create(username: "arun4",email: "arun4@google.com",password: "password",password_confirmation: "password",gender: "male",age: "21",bio: "athelte")
User.create(username: "arun5",email: "arun5@google.com",password: "password",password_confirmation: "password",gender: "male",age: "21",bio: "athelte")
User.create(username: "arun6",email: "arun6@google.com",password: "password",password_confirmation: "password",gender: "male",age: "21",bio: "athelte")

puts "6 users created"