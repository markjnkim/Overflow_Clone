require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  validate :password_present

  has_many :questions
  has_many :answers
  has_many :votes

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

  def self.authenticate(username,plain_text_password)
    user = self.find_by(username: username)
    return user if user && user.password == plain_text_password
  end

  def has_not_voted?(id, type)
    self.votes.select { |vote| vote.voteable_id == id && vote.voteable_type == type }.empty?
  end
end


