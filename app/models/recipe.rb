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

    def self.monthly_ranking
	    year = Time.now.strftime('%Y').to_i
	    start_month = [1, 4, 7, 10]
	    end_month = [3, 6, 9, 12]
	    beginning_of_month_list = start_month.map { |m| Time.new(year, m).beginning_of_month }
	    end_of_month_list = end_month.map { |m| Time.new(year, m).end_of_month }
	    beginning_of_month_list.zip(end_of_month_list).map do |beginning_of_month, end_of_month|
	      Recipe.where(created_at: (beginning_of_month)..(end_of_month))
	            .where(id: Like.group(:recipe_id).order('count(recipe_id) desc').pluck(:recipe_id))
	    end
	end
end
