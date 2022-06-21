class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :game_state
      t.string :board
      t.integer :is_turn
      t.string :winner
      t.integer :board_moves
      t.integer :player1_id
      t.integer :player2_id

      t.timestamps
    end
  end
end
