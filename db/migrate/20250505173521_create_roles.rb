class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.references "movie"
      t.references "actor"
      t.string "character_name"
      t.timestamps
    end
  end
end
