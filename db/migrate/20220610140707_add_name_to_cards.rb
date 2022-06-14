class AddNameToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :name, :string
  end
end
