class DropTableRecipeItem < ActiveRecord::Migration[5.2]
  def change
  	drop_table :recipe_items
  end
end
