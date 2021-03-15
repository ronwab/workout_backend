# frozen_string_literal: true

class WorkoutLogsController < ApplicationController
  def create
    create_workout_log = WorkoutLog.create!(workoutlog_params)
    render json: create_workout_log, status: :created
  end

  def workout_log
    @workout_log ||= WorkoutLog.find(params[:id])
  end

  private

  def workoutlog_params
    params.permit(:activity, :start_time, :end_time, :description, :person_id, :workout_id)
  end
end
