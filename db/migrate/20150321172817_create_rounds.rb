class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id 
      t.intger :deck_id
      t.string :deck_order
      
      t.timestamps
    end
  end
end
