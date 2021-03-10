# frozen_string_literal: true

class Person < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email_address, :phone
  validates_uniqueness_of :phone, :email_address

  has_many :workout_logs
  has_many :workouts, through: :workout_logs
end
