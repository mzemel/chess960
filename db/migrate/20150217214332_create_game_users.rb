class CreateGameUsers < ActiveRecord::Migration
  def change
    create_table :game_user_joins do |t|
      t.integer :game_id
      t.integer :user_id
      t.boolean :color
      t.timestamps
    end
  end
end
