class User < ActiveRecord::Base

  attr_accessor :phone_number

  attr_accessible :email, :first_name, :last_name, :middle_name, :password, :password_confirmation, :phone_number, :prefix, :suffix

  has_secure_password

  #belongs_to :account
  before_save :create_remember_token
  before_save { |user| user.email = email.downcase }
  before_save { |user| user.normalised_number = phone_number || '' }

  #validates :account_id, presence: true
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

  def normalised_number=(value)
    #  attribute_before_cast? override - strip
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end