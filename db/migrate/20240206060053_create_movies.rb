class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string "Name"
      t.integer "Year_Released"
      t.string "Rating"
      t.timestamps
    end
  end
end
