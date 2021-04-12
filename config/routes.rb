# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :people, :workout_log, :users

  # call weather endpoint
  get '/get_weather', to: 'workout_logs#get_weather'

  # get person_detail
  get '/person_detail', to: 'users#person_detail'

  # resources :users, param: :username

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
