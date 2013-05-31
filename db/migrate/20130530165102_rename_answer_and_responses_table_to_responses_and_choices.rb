class RenameAnswerAndResponsesTableToResponsesAndChoices < ActiveRecord::Migration
  def change
    rename_table :responses, :choices
    rename_table :answers, :responses
  end
end
