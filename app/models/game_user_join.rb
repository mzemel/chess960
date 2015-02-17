# join table between Game and User

class GameUserJoin < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validates_presence_of :color

  COLOR_MAP = {
    0 => "White",
    1 => "Black"
  }

  def color
    GameUserJoin::COLOR_MAP[self[:color]]
  end
end