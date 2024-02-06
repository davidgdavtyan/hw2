class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string "Character Name"
      t.timestamps
    end
  end
end
