# frozen_string_literal: true

class WorkoutLog < ApplicationRecord
  belongs_to :workout
  belongs_to :person
end
