class Recipe < ApplicationRecord
	attachment :image
	belongs_to :item

	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user

	ransacker :likes_count do
      query = '(SELECT COUNT(likes.recipe_id) FROM likes where likes.recipe_id = recipes.id GROUP BY likes.recipe_id)'
      Arel.sql(query)
    end
end
