class AddChipsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :chips, :integer, default: 0
  end
end
