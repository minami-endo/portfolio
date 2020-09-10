class AddStatusToGifts < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :gift_status, :boolean, default: false, null: false
  end
end
