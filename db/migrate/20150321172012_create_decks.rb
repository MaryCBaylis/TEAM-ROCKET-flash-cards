class CreateDecks < ActiveRecord::Migration
  def change 
    create_table :decks do |t| 
      t.string :title 
      t.boolean :complete 
      t.integer :legendary_pokemon_id
      
      t.timestamps
    end 
  end
end
