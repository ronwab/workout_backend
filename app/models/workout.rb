class Workout < ApplicationRecord
  validates_presence_of :workout_name, :description
  validates_uniqueness_of :workout_name
end