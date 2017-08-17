class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :body
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
