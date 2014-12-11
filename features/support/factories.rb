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
    f.sign_in_count "1"
  end

  trait :admin do
    admin true
  end

  trait :set_line_manager do
    line_manager true
  end

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

  factory :linemanager do |f|
    f.id
    f.user_id "1"
  end

  factory :users_linemanager do |f|
    association :user
    association :linemanager
  end

  factory :skill do |f|
    f.id
    f.skill_name "MS Word"
    f.skill_code "SOSK"
    f.skill_type "Non IT Technical Skills"
  end

  factory :user_skill do |f|
    association :user
    association :skill
    f.skill_level "Basic"
    f.date_last_used "0 - 6 Months"
  end

  factory :role do |f|
    f.id
    f.role_name "Tester"
    f.role_description "Provides Quality Assurance"
  end

  factory :role_skill do |f|
    association :role
    association :skill
  end

end
