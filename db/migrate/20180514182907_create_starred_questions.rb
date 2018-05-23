class CreateSavedQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_questions do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.string :title
      t.text :body
      t.integer :department

      t.timestamps
    end
  end
end
