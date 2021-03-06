class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :teams 

  validates_presence_of :email, :name
  validate :password_or_omniauth
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: " is not valid. Please add a valid email"


  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end

  private

  def password_or_omniauth
    return if (!password.nil? || (!provider.nil? && !uid.nil?))
    #errors.add(:password, "can't be empty") 
    end
  end
