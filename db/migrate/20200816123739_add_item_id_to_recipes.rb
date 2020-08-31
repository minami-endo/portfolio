class AddItemIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :item_id, :integer
  end
end
