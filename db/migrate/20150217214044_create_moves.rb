class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :game_id
      t.integer :game_piece_id
      t.string :summary
      t.string :start
      t.string :finish
      t.timestamps
    end
  end
end
