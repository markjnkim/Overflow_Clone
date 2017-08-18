class CreateAnswerComments < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_comments do |t|
      t.integer :answer_id, null: false
      t.integer :comment_id, null: false

      t.timestamps
    end
  end
end
