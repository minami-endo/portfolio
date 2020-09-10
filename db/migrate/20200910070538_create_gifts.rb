class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :name
      t.text :comment
      t.string :image_id

      t.timestamps
    end
  end
end
