require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  validate :password_present

  has_many :questions
  has_many :answers

  def password_present
    @errors.add(:password, 'cannot be blank') if self.password == ''
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email,plain_text_password)
    user = self.find_by(email: email)
    return user if user && user.password == plain_text_password
  end
end
