class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :image_id
      t.string :name
      t.string :ingredient
      t.integer :time
      t.integer :difficulty_level
      t.text :how_to_make

      t.timestamps
    end
  end
end
