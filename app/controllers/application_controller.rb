# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found
    render json: { error: 'not found' }
  end

  def authorize_request
    header = request.headers['authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: 401
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: 401
    end
  end
end
