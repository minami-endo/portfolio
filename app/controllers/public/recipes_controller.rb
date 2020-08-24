class Public::RecipesController < ApplicationController
  before_action :authenticate_public_user!, except: [:index, :show, :ranking]

  def ranking
    @monthly_ranking = Recipe.monthly_ranking
    #いらない↓つきに囚われないランキングを表示させないなら、いらない
    #@recipe_ranks = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').pluck(:recipe_id))
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

  def new
    @recipe = Recipe.new
    @item = Item.find(params[:recipe][:item_id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @item = Item.find(params[:recipe][:item_id])
    @recipe.user_id = current_public_user.id
    @recipe.save
    redirect_to public_recipes_path
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to public_recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to public_recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:user_id, :item_id, :image, :name, :ingredient, :time, :difficulty_level, :how_to_make)
  end
  def search_params
    params.require(:q).permit(:sorts)
  end
end
