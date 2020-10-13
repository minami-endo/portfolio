class Public::RecipesController < ApplicationController
  before_action :authenticate_public_user!, except: [:index, :show, :ranking]

  def ranking
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

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
    @item = Item.find(params[:recipe][:item_id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @item = Item.find(params[:recipe][:item_id])
    @recipe.user_id = current_public_user.id
    if @recipe.save
      redirect_to public_recipes_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to public_recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to public_recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :item_id, :image, :name, :time, :difficulty_level, :how_to_make, ingredients_attributes: [:id, :recipe_id, :name, :deleted_flag])
  end

  def search_params
    params.require(:q).permit(:sorts, :name_cont)
  end
end
