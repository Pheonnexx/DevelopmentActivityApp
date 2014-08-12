require 'seed-fu'

User.seed do |s|
  s.id    = 1
  s.first_name = "Mary Jane"
  s.surname = "Watson"
  s.email = "pheonn1@gmail.com"
  s.password  = "heather4"
  s.password_confirmation = "heather4"
  s.workgroup = "test"
end

#users = User.create([{ first_name: 'Mary Jane', surname: 'Watson', email: 'pheonn1@gmail.com', 
#	password: 'heather4', password_confirmation: 'heather4', workgroup: 'test'}])