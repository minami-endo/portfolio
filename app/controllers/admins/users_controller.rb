class Admins::UsersController < ApplicationController
  before_action :authenticate_admins_admin!

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: @user.id).page(params[:page])
  end
end
