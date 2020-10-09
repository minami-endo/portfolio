class AddDeletedFlagToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :deleted_flag, :boolean, default: false
  end
end
