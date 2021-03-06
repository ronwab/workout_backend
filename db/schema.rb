# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_402_111_629) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'people', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email_address'
    t.string 'phone'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email_address'
    t.string 'password_digest'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'phone'
    t.string 'address'
    t.string 'city'
    t.string 'state'
    t.integer 'zipcode'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'workout_logs', force: :cascade do |t|
    t.string 'activity'
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.string 'description'
    t.integer 'person_id'
    t.integer 'workout_id'
  end

  create_table 'workouts', force: :cascade do |t|
    t.string 'workout_name'
    t.string 'description'
  end

  add_foreign_key 'workout_logs', 'people'
  add_foreign_key 'workout_logs', 'workouts'
end
