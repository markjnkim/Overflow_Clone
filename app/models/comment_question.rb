class CommentQuestion < ActiveRecord::Base
  validates :question_id, :comment_id, presence: true

  belongs_to :comment
  belongs_to :question
end
