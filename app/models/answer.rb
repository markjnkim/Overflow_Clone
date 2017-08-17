class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question
  has_many :votes, as => :voteable
  validates :text, :user_id, :question_id, presence: true
end
