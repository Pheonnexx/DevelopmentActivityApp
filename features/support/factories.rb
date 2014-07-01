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