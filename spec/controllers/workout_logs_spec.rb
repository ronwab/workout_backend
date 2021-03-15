# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkoutLogsController, type: :controller do
  describe '#create' do
    let(:person) { FactoryGirl.create(:person) }
    let(:workout) { FactoryGirl.create(:workout) }
    it 'successfully creates a new workout log' do
      workoutlog_params = { activity: 'running', start_time: Time.now, end_time: Time.now + 30.minutes, description: 'it sucked', person_id: person.id, workout_id: workout.id }
      expect do
        post :create, { params: workoutlog_params }
      end.to change { WorkoutLog.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end
