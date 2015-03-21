class CreatePokedexEntries < ActiveRecord::Migration
  def change
    create_table :pokedex_entries do |t|
      t.integer :user_id
      t.integer :pokemon_id
      
      t.timestamps
    end
  end
end
