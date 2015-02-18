class User < ActiveRecord::Base
  has_many :game_user_joins
  has_many :games, through: :game_user_joins

  validates_presence_of :name
end