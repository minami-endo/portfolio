class Public::ItemsController < ApplicationController
  def home
    @items = Item.page(params[:page]).reverse_order
  end

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
    @recipe = Recipe.new
    @recipes = Recipe.where(item_id: @item.id)
    recipe_ids = @item.recipes.pluck(:id)
    likes_recipe_ids = Like.where(recipe_id: recipe_ids).group(:recipe_id).order('count(recipe_id) desc').pluck(:recipe_id)
    @recipe_ranks = Recipe.find(likes_recipe_ids)
    @not_likes_recipes = @recipes.where.not(id: likes_recipe_ids).page(params[:page])
  end
end
