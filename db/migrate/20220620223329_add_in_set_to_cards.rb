class AddInSetToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :in_set, :boolean, default: false
  end
end
