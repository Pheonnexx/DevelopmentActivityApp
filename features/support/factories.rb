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
  	f.workgroup "Test"
    f.job_grade "RE2U"
    f.location "IS"
    f.team "Testing"
  	f.password "password1"
  	f.password_confirmation "password1"
    f.admin false
    f.role_id "1"
  end

  trait :admin do
    admin true
  end

end

FactoryGirl.define do

  factory :dev_activity do |f|
    f.user_id "1"
    f.id
    f.dev_type "Book"
    f.activity_completed_at "02/02/2012"
    f.time_taken "2.0"
    f.notes "notes"
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
    f.skill_level "1"
    f.user_id "1"
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