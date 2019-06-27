class RemoveUserIdFromAnswerChoice < ActiveRecord::Migration[5.2]
  def change
    remove_column :answer_choices, :user_id, :integer
    remove_column :responses, :question_id
  end
end
