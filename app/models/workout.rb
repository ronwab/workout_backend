# frozen_string_literal: true

class Workout < ApplicationRecord
  validates_presence_of :workout_name, :description
  validates_uniqueness_of :workout_name

  has_many :workout_logs
  has_many :people, through: :workout_logs
end
