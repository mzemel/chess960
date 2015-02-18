class CreateGamePieces < ActiveRecord::Migration
  def change
    create_table :game_pieces do |t|
      t.integer :latitude
      t.integer :longitude
      t.string :position
      t.integer :game_id
      t.integer :piece_id
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
