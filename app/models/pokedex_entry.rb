class PokedexEntry < ActiveRecord::Base
  has_many :users
  has_many :pokemon
end
