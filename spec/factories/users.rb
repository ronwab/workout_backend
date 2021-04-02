# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    username 'MyString'
    email 'MyString'
    password_digest 'MyString'
  end
end
