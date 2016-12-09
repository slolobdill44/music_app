# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(email: "steve", password: "stevebrule")
user2 = User.create!(email: "scott", password: "mrclams")
user3 = User.create!(email: "adrian", password: "mradrian")
