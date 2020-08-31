class ChangeDifficultyLevelOfRecipes < ActiveRecord::Migration[5.2]
  def change
  	change_column :recipes, :difficulty_level, :integer, default: 0
  end
end
