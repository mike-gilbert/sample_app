class User < ActiveRecord::Base

  attr_accessor :phone_number

  attr_accessible :email, :first_name, :last_name, :middle_name, :password, :password_confirmation, :phone_number, :prefix, :suffix

  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :last_name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
end