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
  	f.password "password1"
  	f.password_confirmation "password1"
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