class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question
  has_many :answer_comments
  has_many :comments, through: :answer_comments

  validates :text, :user_id, :question_id, presence: true
end
