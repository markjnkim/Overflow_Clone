class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_one :best_answer, class_name: "Answer"

  validates :title, presence: true
  validates :user_id, presence: true
end
