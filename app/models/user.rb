class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  has_many :links

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
