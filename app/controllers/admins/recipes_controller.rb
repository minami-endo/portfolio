class Admins::RecipesController < ApplicationController
  before_action :authenticate_admins_admin!

  def home
    @recipes = Recipe.all
    @today_recipe = 0
    @recipes.each do |recipe|
      if recipe[:created_at].to_s.match(/#{Date.today.to_s}.+/)
        @today_recipe += 1
      end
    end

    Range.new(Time.zone.now, Time.zone.now.since(3.month))
    @recipe_ranks = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').pluck(:recipe_id))
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def ranking
    @recipe_ranks = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').pluck(:recipe_id))
  end

  def top
    @recipe_ranks = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').limit(1).pluck(:recipe_id))
  end

end
