# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :username, :password
  validates_uniqueness_of :email, :username
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
