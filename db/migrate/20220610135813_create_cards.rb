class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.integer :value
      t.string :suit
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
