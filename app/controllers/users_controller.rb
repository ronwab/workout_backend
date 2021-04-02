# frozen_string_literal: true
# https://medium.com/binar-academy/rails-api-jwt-authentication-a04503ea3248

class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  def index
    binding.pry

    @users = User.all
    render json: @users, status: 200
  end

  def show
    render json: @user, status: ok
  end

  def create
    # binding.pry
    @user = User.create(user_params)

    if @user
      render json: @user, status: 201
    else
      render json: { errors: @user.errors.full_message }, status: 422
    end
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_message }, status: 422
    end
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username!(params[:username])

  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
