class Pokemon < ActiveRecord::Base
  belongs_to :pokedex_entry
  belongs_to :card
  has_and_belongs_to_many :users, :join_table => :pokedex_entries
end
