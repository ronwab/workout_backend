# frozen_string_literal: true

class AddRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :workout_logs, :person_id, :integer
    add_column :workout_logs, :workout_id, :integer

    add_foreign_key :workout_logs, :people
    add_foreign_key :workout_logs, :workouts
  end
end
