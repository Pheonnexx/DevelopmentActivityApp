# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create!([{ id: '1234', first_name: 'Super', surname: 'User', email: 'superuser1@gmail.com', password: '!superuser1', password_confirmation: '!superuser1', workgroup: 'testing', admin: 'true', line_manager: 'true', role_id: '1234'}])

#skills = Skill.create([{ skill_name: 'MS Excel', skill_code: 'SOSK', skill_type: 'Non Technical IT Skill' }])

roles = Role.create([{ id: '1234', role_name: 'Testing', role_description: 'Quality Assurance' }])

line_managers = Linemanager.create!([{ id: '1234', user_id: '1234'}])