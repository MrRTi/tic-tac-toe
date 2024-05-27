class CreateMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :row
      t.integer :column
      t.string :symbol

      t.timestamps

      t.index [:game_id, :row, :column], unique: true
    end
  end
end
