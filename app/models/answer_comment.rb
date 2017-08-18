class AnswerComment < ActiveRecord::Base
  validates :answer_id, :comment_id, presence: true

  belongs_to :comment
  belongs_to :answer
end
