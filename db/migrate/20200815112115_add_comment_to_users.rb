class AddCommentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :comment, :text
    add_column :users, :image_id, :string
  end
end
