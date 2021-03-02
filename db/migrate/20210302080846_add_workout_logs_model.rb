class AddWorkoutLogsModel < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_logs do |t|
      t.string   :activity
      t.datetime :start_time
      t.datetime :end_time
      t.string   :description
    end
  end
end