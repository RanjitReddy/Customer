Customer Application:

 Rails: 5.2.4.4
 Ruby: 2.5.1

 Heroku URL: http://customer-omniapp.herokuapp.com/
 APIS:

 1) http://customer-omniapp.herokuapp.com/api/v1/sign_up
 params: 
 user[email]
 user[password]
 user[password_confirmation]
 user[gender] => 'Male' / 'Female'
 user['phone_number']
 user['user_name']
 user['date_of_birth'] => 'mm/dd/yyyy'

 2) http://customer-omniapp.herokuapp.com/api/v1/sign_in
 params: 
 user[email]
 user[password]

 3) Roles
 http://customer-omniapp.herokuapp.com/api/v1/roles

 Implemented cancan 
 
 Roles(and few sample user accounts) are been seeded via rails db:seed . 
