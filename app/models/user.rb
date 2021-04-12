# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email_address, :username, :password
  validates_uniqueness_of :email_address, :username
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }
end
