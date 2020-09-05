class Admins::RecipesController < ApplicationController
  before_action :authenticate_admins_admin!

  def home
    @recipes = Recipe.all
    @today_recipe = 0
    @recipes.each do |recipe|
      if recipe[:created_at].to_s.match(/#{Date.today}.+/)
        @today_recipe += 1
      end
    end
    @monthly_ranking = Recipe.monthly_ranking.page(params[:page])
  end

  def index
    if params[:q].present?
      @search = Recipe.ransack(search_params)
      @recipes = @search.result.page(params[:page])
    else
      params[:q] = { sorts: 'id desc' }
      @search = Recipe.ransack
      @recipes = Recipe.page(params[:page])
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def top
    @recipe_ranks = Recipe.monthly_top
    @previous_top_ranks = Recipe.previous_monthly_top
  end

  def search_params
    params.require(:q).permit(:sorts, :name_cont)
  end
end
