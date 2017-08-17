class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question

  validates :text, :user_id, :question_id, presence: true
end
