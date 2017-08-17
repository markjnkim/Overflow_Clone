class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :value, null:false
      # t.string :question_id, null: false
      # t.string :answer_id, null: false
      t.integer :voteable_id, null: false
      t.string :voteable_type, null: false
      t.integer :user_id, null:false

      t.timestamps
    end
  end
end
