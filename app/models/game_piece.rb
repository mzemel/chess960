# This represents the 32 pieces that have been instantiated for a game, from the abstract Piece representation class
class GamePiece < ActiveRecord::Base
  belongs_to :game
  has_many :moves

  validates_presence_of :game

  before_save :update_position

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  scope :white, -> { where("piece_id <= ?", 16)}
  scope :black, -> { where("piece_id > ?", 16)}
  scope :white_pawns, ->  { white.where("piece_id > ?", 8) }
  scope :white_pieces, -> { white.where("piece_id <= ?", 9) }
  scope :black_pawns, -> { black.where("piece_id <= ?", 24) }
  scope :black_pieces, -> { black.where("piece_id > ?", 24)}

  def self.instantiate_new_collection(game)
    32.times.collect do |i|
      GamePiece.create(piece_id: i+1, game: game)
    end
  end

  # For now, this will randomize the white and black back row, keeping the pawns in the middle
  # To do: keep king and rooks where they should be
  def self.randomize!(collection)
    setup_white_pawns collection
    randomize_white_pieces collection
    setup_black_pawns collection
    randomize_black_pieces collection
    return collection
  end

  def self.setup_white_pawns(collection)
    collection.white_pawns.each_with_index do |pawn, i|
      pawn.update_column(:longitude, 1)
      pawn.update_column(:latitude, i)
      pawn.save
    end
  end

  def self.randomize_white_pieces(collection)
    collection.white_pieces.shuffle.each_with_index do |piece, i|
      piece.update_column(:longitude, 0)
      piece.update_column(:latitude, i)
      piece.save
    end
  end

  def self.setup_black_pawns(collection)
    collection.black_pawns.each_with_index do |pawn, i|
      pawn.update_column(:longitude, 6)
      pawn.update_column(:latitude, i)
      pawn.save
    end
  end

  def self.randomize_black_pieces(collection)
    collection.black_pieces.shuffle.each_with_index do |piece, i|
      piece.update_column(:longitude, 7)
      piece.update_column(:latitude, i)
      piece.save
    end
  end

  def name
    Piece::NAME_MAP[piece_id]
  end

  def position
    return "NaN" unless latitude && longitude
    self[:postion] || "#{Board::LATITUDE_MAP[latitude]}#{Board::LONGITUDE_MAP[longitude]}"
  end

  def update_position
    return nil unless latitude && longitude
    self.position = "#{Board::LATITUDE_MAP[latitude]}#{Board::LONGITUDE_MAP[longitude]}"
  end
end