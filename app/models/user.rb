class User < ActiveRecord::Base
  has_many :game_user_joins
  has_many :games, through: :game_users

  validates_presence_of :name
end