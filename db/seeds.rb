# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: 'admin@iiitb.org', name: 'Admin', admin: 1, status: 1, password: 'thanks123')
iiitb = Organisation.create(name: "IIIT Bangalore", user: admin)
