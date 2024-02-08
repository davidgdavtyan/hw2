class AddActorIdToRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :Actor_ID, :integer
  end
end
