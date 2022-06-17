class AddInUseToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :in_use, :boolean, default: false
  end
end
