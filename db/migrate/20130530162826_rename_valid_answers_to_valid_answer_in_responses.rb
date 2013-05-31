class RenameValidAnswersToValidAnswerInResponses < ActiveRecord::Migration
  def change
    rename_column :responses, :valid_answers, :valid_answer
  end
end
