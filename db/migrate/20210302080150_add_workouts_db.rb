# frozen_string_literal: true

class AddWorkoutsDb < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :workout_name
      t.string :description
    end
  end
end
