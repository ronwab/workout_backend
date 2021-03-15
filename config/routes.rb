# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :people, :workout_logs

  # call weather endpoint
  get '/get_weather', to: 'workout_logs#get_weather'
end
