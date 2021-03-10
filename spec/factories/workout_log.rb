# frozen_string_literal: true

FactoryGirl.define do
  factory :workout_log do
    activity 'Running'
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
    end_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
    description { Faker::TvShows::Simpsons.quote }
    person_id { Faker::Number.decimal_part(digits: 5) }
    workout_id { Faker::Number.decimal_part(digits: 5) }
  end
end
