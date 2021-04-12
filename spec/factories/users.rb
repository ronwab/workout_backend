# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    username { Faker::Superhero.power }
    password 'Password@1'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email_address { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip_code }
  end
end
