class CreateGameMoves < ActiveRecord::Migration
  def change
    create_table :game_move_joins do |t|
      t.integer :game_id
      t.integer :move_id
      t.timestamps
    end
  end
end
