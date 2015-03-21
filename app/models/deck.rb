class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :users, through: :rounds
  belongs_to :legendary_pokemon, class_name: 'Pokemon'
end
