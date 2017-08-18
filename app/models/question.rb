class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  belongs_to :best_answer, class_name: "Answer", optional: true
  has_many :comment_questions
  has_many :comments, through: :comment_questions

  validates :title, presence: true
  validates :user_id, presence: true
end
