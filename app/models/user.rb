require 'bcrypt'

class User < ActiveRecord::Base
  has_and_belongs_to_many :pokemon, :join_table => :pokedex_entries
  has_many :rounds
  has_many :decks, through: :rounds
  has_many :cards, through: :decks
  has_many :pokemon, through: :cards
  
  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true 
  
  def password=(plaintext_password)
    self.password_digest = BCrypt::Password.create(plaintext_password)
  end
  
  def self.authenticate(email, password)
    user = User.where(email: email).first
    if BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
  
end