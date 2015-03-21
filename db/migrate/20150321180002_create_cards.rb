class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.integer :pokemon_id
      t.integer :deck_id
      t.boolean :correct, default: false
      
      t.timestamps
    end
  end
end
