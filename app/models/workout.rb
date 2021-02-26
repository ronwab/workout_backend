class Workout  <ApplicationRecord
  validates_presence_of :activity, :start_time, :end_time, :distance, :unit
end