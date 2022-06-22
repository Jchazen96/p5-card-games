class AddRequestedCardToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :requested_card, :integer
  end
end
