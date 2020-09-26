class Admins::ItemsController < ApplicationController
  before_action :authenticate_admins_admin!

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path
  end

  def show
    @item = Item.find(params[:id])
    @recipes = Recipe.where(item_id: @item.id)
    recipe_ids = @item.recipes.pluck(:id)
    likes_recipe_ids = Like.where(recipe_id: recipe_ids).group(:recipe_id).order('count(recipe_id) desc').pluck(:recipe_id)
    @recipe_ranks = Recipe.find(likes_recipe_ids)
    @not_likes_recipes = @recipes.where.not(id: likes_recipe_ids).page(params[:page])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admins_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :caption, :image, :price)
  end
end
