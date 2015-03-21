class User < ActiveRecord::Base
  has_and_belongs_to_many :pokemon, :join_table => :pokedex_entries
  has_many :rounds
  has_many :decks, through: :rounds
  
  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true 
end