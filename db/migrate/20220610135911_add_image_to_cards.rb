class AddImageToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :image, :string
  end
end
