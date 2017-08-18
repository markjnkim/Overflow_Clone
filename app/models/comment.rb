class Comment < ActiveRecord::Base
  include Voteable
  validates :body, :user_id, presence: true

  belongs_to :user
  has_one :comment_question
  has_one :question, through: :comment_question
  has_one :answer_comment
  has_one :answer, through: :answer_comment
  has_many :votes, as: :voteable
end
