class Recipe < ApplicationRecord
  attachment :image
  belongs_to :item
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  validates :ingredient, presence: true
  validates :time, presence: true
  validates :how_to_make, presence: true, length: { minimum: 1, maximum: 200 }
  validates :item_id, presence: true
  validates :user_id, presence: true

  enum difficulty_level: { easy: 0, medium: 1, hard: 2 }

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.recipe_id) FROM likes where likes.recipe_id = recipes.id GROUP BY likes.recipe_id)'
    Arel.sql(query)
  end

  def self.monthly_ranking
    beginning_of_month = period[:start_month]
    end_of_month = period[:end_month]
    where(created_at: beginning_of_month..end_of_month).
    where(id: Like.group(:recipe_id).order('count(recipe_id) desc').pluck(:recipe_id))
  end

  def self.monthly_top
   beginning_of_month = period[:start_month]
   end_of_month = period[:end_month]
   joins(:likes).merge(Like.group(:recipe_id).order('count(recipe_id) desc'))
                .where(created_at: beginning_of_month..end_of_month).first
  end

   def self.period
    year = Time.now.strftime('%Y').to_i
    start_months = [1, 4, 7, 10]
    end_months = [3, 6, 9, 12]
    beginning_of_month_list = start_months.map { |m| Time.new(year, m).beginning_of_month }
    end_of_month_list = end_months.map { |m| Time.new(year, m).end_of_month }
    periods = beginning_of_month_list.zip(end_of_month_list)
    start_month = 0
    end_month = 0
    periods.each do |period|
      if period[0] < DateTime.now && DateTime.now < period[1]
        start_month = period[0]
        end_month = period[1]
      end
    end
    { start_month: start_month, end_month: end_month }
   end

   def self.previous_monthly_top
   beginning_of_month = previous_period[:start_month]
   end_of_month = previous_period[:end_month]
   joins(:likes).merge(Like.group(:recipe_id).order('count(recipe_id) desc'))
                .where(created_at: beginning_of_month..end_of_month).first
   end

   def self.previous_period
    year = Time.now.strftime('%Y').to_i
    previous_start_month = [1, 4, 7, 10]
    previous_end_month = [3, 6, 9, 12]
    beginning_of_month_list = previous_start_month.map { |m| Time.new(year, m).beginning_of_month }
    end_of_month_list = previous_end_month.map { |m| Time.new(year, m).end_of_month }
    previous_periods = beginning_of_month_list.zip(end_of_month_list)
    previous_start_month = 0
    previous_start_month = 0
    previous_periods.each do |period|
      if period[0] < DateTime.now && DateTime.now < period[1]
        previous_start_month = period[(0-1).to_i]
        previous_end_month = period[(1-1).to_i]
      end
    end
    { start_month: previous_start_month, end_month: previous_end_month }
   end
end
