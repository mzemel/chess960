# Handles logic of capturing and update positions of pieces
class Move < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_piece

  validates_presence_of :game_piece

  # To do: refactor this interface to only take "e4" and infer starting piece/position
  # For now, we'll be given start point and end point
  def initialize(*args)
    super
    self.game_piece = game.game_pieces.find_by_position(start)
    save!
    return self
  end

  def resolve
    GamePiece.find_by_position(finish) ? relocate_and_capture : relocate
    self
  end

  def relocate_and_capture
    puts "relocate_and_capture"
  end

  def relocate
    game_piece.latitude  = Board::REVERSE_LATITUDE_MAP[finish[0]]
    game_piece.longitude = Board::REVERSE_LONGITUDE_MAP[finish[1]]
    game_piece.save!
  end

end