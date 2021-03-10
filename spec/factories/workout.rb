# frozen_string_literal: true

FactoryGirl.define do
  factory :workout do
    workout_name 'swim'
    description { Faker::TvShows::Simpsons.quote }
  end
end
