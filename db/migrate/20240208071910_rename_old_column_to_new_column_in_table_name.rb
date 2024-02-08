class RenameOldColumnToNewColumnInTableName < ActiveRecord::Migration[6.0]
  def change
    rename_column :roles, :Actor_ID, :actor_id
  end
end
