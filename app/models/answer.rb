class Answer < ActiveRecord::Base
  include Voteable
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :answer_comments
  has_many :comments, through: :answer_comments

  validates :text, :user_id, :question_id, presence: true
end
