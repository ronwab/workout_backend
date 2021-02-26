# frozen_string_literal: true

class CreateWorkoutModel < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :activity
      t.datetime :start_time
      t.datetime :end_time
      t.integer :distance
      t.string :unit
      t.string :notes
    end
  end
end
