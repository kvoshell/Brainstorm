class ChangeStarredToSavedQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_table :saved_questions, :saved_questions
  end
end
