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
    @monthly_ranking = Recipe.monthly_ranking
  end

  def index
    if params[:q].present?
      @search = Recipe.ransack(search_params)
      @recipes = @search.result
    else
      params[:q] = { sorts: 'id desc' }
      @search = Recipe.ransack()
      @recipes = Recipe.all
    end

    @text_search = Recipe.ransack(params[:q])
    @text_search_recipes = @text_search.result
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def top
    @recipe_ranks = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').limit(1).pluck(:recipe_id))
  end

  def search_params
    params.require(:q).permit(:sorts)
  end

end
