class CreateCommentQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_questions do |t|
      t.integer :question_id, null: false
      t.integer :comment_id, null: false

      t.timestamps
    end
  end
end
