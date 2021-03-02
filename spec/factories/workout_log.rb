FactoryGirl.define do
  factory :workout_log do
    activity "Running"
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
    end_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
    description { Faker::TvShows::Simpsons.quote }
  end
end
