class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :summary
      t.timestamps
    end
  end
end
