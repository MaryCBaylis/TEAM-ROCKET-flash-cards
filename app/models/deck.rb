class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :users, through: :rounds
  has_many :cards
  belongs_to :legendary_pokemon, class_name: 'Pokemon'

  def deck_shuffle
    cards.shuffle
  end
end
