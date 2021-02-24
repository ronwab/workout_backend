# frozen_string_literal: true

FactoryGirl.define do
  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email_address { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
