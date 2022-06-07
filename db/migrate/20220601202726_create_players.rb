class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :points
      t.bool :is_x
      
      t.timestamps
    end
  end
end
