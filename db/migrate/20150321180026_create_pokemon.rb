class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemon do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
