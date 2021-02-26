FactoryGirl.define do
  factory :workout do
    activity "Run"
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) }
    end_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) }
    distance { Faker::Number.decimal(l_digits: 2) }
    unit "Miles"
    notes { Faker::Quote.famous_last_words  }
  end
end
