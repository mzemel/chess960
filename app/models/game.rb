class Game < ActiveRecord::Base
  has_many :game_move_joins
  has_many :moves, through: :game_move_joins
  has_many :game_user_joins
  has_many :users, through: :game_user_joins

  def self.setup_game(player_one, player_two)
    game = Game.create
    GameUserJoin.create(game: game, user: player_one, color: 0)
    GameUserJoin.create(game: game, user: player_two, color: 1)
    game
  end

  def enter_move(move)
    moves << move
  end

  # move to decorator?
  def to_pgn
    moves.map(&:summary).each_slice(2).each_with_index.map do |pair, i|
      "#{i + 1}. #{pair[0]} ... #{pair[1]}"
    end.join(", ")
  end
end

