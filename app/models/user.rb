class User < ActiveRecord::Base

  attr_accessor :phone_number

  attr_accessible :email, :first_name, :last_name, :middle_name, :password, :password_confirmation, :phone_number, :prefix, :suffix

  has_secure_password

  before_save { |user|
    user.email = email.downcase
    #user.normalised_number = phone_number.strip
    # Should be creating a user_phone_history entry
  }

  validates :last_name, presence: true, length: {maximum: 50}

  validates :phone_number, presence: true, length: {maximum: 20}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end