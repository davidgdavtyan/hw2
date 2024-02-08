class AddColumnNameToRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :movie_id, :integer
  end
end
