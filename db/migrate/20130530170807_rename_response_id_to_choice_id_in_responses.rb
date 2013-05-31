class RenameResponseIdToChoiceIdInResponses < ActiveRecord::Migration
  def change
    rename_column :responses, :response_id, :choice_id
  end
end
