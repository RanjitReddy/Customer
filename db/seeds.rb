# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r1 = Role.create({ name: 'Customer', code: 'CUST123' })
r2 = Role.create({ name: 'Branch Manager', code: 'BM123' })

role = Role.find_by_name('Branch Manager')
user = User.create({user_name: 'Manager', password: 'password', password_confirmation: 'password', email: 'manager@yopmail.com',
					gender: 'Male', date_of_birth: '01/01/1975', role_id: role.id, phone_number: '9966599665'})
user = User.create({user_name: 'Ranjit', password: 'password', password_confirmation: 'password', email: 'customer@yopmail.com',
					gender: 'Male', date_of_birth: '01/01/1987', role_id: r1.id, phone_number: '9966599665'})