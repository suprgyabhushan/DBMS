# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Account.create(meta: true, meta_name: 'withdrawal')
Account.create(meta: true, meta_name: 'deposit')
Account.create(meta: true, meta_name: 'revenue')

User.create(email: 'admin@iiitb.org', password: 'thanks123', admin: true, status: 1)
User.create(email: 'gsr@iiitb.org', password: 'thanks123', name: "G Srinivasaraghavan", status: 1)
User.create(email: 'prasanna@iiitb.org', password: 'thanks123', name: 'GNS Prasanna', status: 1)
User.create(email: 'sri@iiitb.org', password: 'thanks123', name: 'Srinath Srinivasa', status: 1)

Domain.create(name:'Data Science')
Domain.create(name:'Algorithms')
Domain.create(name:'Computational Geometry')
Domain.create(name:'Information Retrieval')
Domain.create(name:'Networking')

Organisation.create(name: 'IIIT Bangalore', user_id: 1)
