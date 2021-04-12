# frozen_string_literal: true

# https://medium.com/binar-academy/rails-api-jwt-authentication-a04503ea3248

class UsersController < ApplicationController
  before_action :authorize_request, except: :create

  def index
    all_users = User.all
    render json: all_users, status: 200
  end

  # Route uses @current_user which is from authorize_request
  def person_detail
    render json: @current_user, status: 200
  end

  def create
    new_user = User.create!(user_params)

    render json: new_user, status: 201
  rescue ActiveRecord::RecordInvalid => e
    handleErrors(e)
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_message }, status: 422
    end
  end

  def update
    find_user.update(user_params)
    render json: { message: "User with id #{find_user[:id]} has been updated" }, status: 200
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: 404
  end

  def destroy
    @user.destroy
  end

  private

  def handleErrors(e)
    render json: { message: e.message }, status: 422
  end

  def user_params
    params.permit(:username, :email_address, :password, :password_confirmation, :first_name, :last_name, :phone, :address, :city, :state, :zipcode)
  end
end
