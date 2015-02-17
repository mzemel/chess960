class Game < ActiveRecord::Base
  has_many :game_move_joins
  has_many :moves, through: :game_move_joins
  has_many :game_user_joins
  has_many :users, through: :game_user_joins
  has_many :game_pieces

  attr_accessor :game_pieces

  def self.setup_game(player_one, player_two)
    game = Game.create
    game.users = [ player_one, player_two ]
    GamePiece.instantiate_new_collection(game)
    game.save!
    game
  end

  def game_pieces
    GamePiece.where(game: self)
  end

  def users=(players)
    raise "Must be two players" unless players.size == 2
    GameUserJoin.create(game: self, user: players[0], color: 0)
    GameUserJoin.create(game: self, user: players[1], color: 1)
  end

  def enter_move(move)
    moves << move
  end

  # move to decorator?
  def to_pgn
    moves.map(&:summary).each_slice(2).each_with_index.map do |pair, i|
      "#{i + 1}. #{pair[0]} #{pair[1]}"
    end.join(" ")
  end
end

