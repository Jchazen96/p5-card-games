class AddIsTurnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_turn, :boolean
  end
end
