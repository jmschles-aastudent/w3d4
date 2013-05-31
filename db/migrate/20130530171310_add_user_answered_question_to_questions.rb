class AddUserAnsweredQuestionToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :user_answered_question, :boolean, :default => false
  end
end
