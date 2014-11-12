require 'factory_girl'

FactoryGirl.define do

  sequence :email do |n| 
    "email#{n}@factory.com"
  end 

  sequence :id do |n| 
    "#{n}"
  end 

  factory :user do |f|
  	f.email
  	f.id
  	f.first_name "Heather"
  	f.surname "Poole"
  	f.password "password1"
  	f.password_confirmation "password1"
    f.admin false
    f.line_manager false
    f.role_id "1"
  end

  trait :admin do
    admin true
  end

  trait :set_line_manager do
    line_manager true
  end

end

FactoryGirl.define do

  factory :dev_activity do |f|
    f.user_id "1"
    f.id
    f.dev_type "Book"
    f.activity_completed_at "02/02/2012"
    f.time_taken "2.0"
    f.development_subject "Subject"
    f.self_directed false
  end

  trait :self_directed do
    self_directed true
  end

end

FactoryGirl.define do 

  factory :linemanager do |f|
    f.id
    f.user_id "1"
  end

end

FactoryGirl.define do

  factory :users_linemanager do |f|
    f.id
    f.user_id "1"
    f.linemanager_id "1"
  end

end
 
FactoryGirl.define do

  factory :skill do |f|
    f.id
    f.skill_name "MS Word"
    f.skill_code "SOSK"
    f.skill_type "Non IT Technical Skills"
  end

end

FactoryGirl.define do

  factory :user_skill do |f|
    f.id
    f.skill_id "1"
    f.skill_level "Basic"
    f.user_id "1"
    f.date_last_used "0 - 6 Months"
  end

end

FactoryGirl.define do 

  factory :role do |f|
    f.id
    f.role_name "Tester"
    f.role_description "Provides Quality Assurance"
  end

end

FactoryGirl.define do

  factory :role_skill do |f|
    f.id
    f.role_id "1"
    f.skill_id "1"
  end

end